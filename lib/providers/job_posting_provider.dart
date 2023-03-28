import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/domain/request/job/recruiter_job_posting_request.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/domain/response/job/job_phone.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/job_posting_repository.dart';
import 'package:platform/service/other_service.dart';
import 'package:platform/storage/secure_local_repository.dart';
import 'package:platform/storage/storage_item.dart';

@injectable
class JobPostingProvider with ChangeNotifier {
  final JobPostingRepository _jobPostingRepository;
  final SecureLocalRepository _secureLocalRepository;
  final OtherService otherService;
  List<JobPosting> allJobPostings = [], allFavoriteJobPosting = [], allFilterJobPosting = [];
  bool isLastPage = false, isFavoriteLastPage = false, isFilterLastPage = false, gender = true;
  int pagingSize = 10, pageNumber = 1, pageFavoriteNumber = 1, pageFilterNumber = 1;
  NetworkStatus networkStatus = NetworkStatus.none;
  String? title, description, userType, nationality;
  JobPosting? jobPosting;
  JobDetail? jobDetail;
  Map<String, String> filterData = {};
  List<String> selectedList = [];

  JobPostingProvider(
    this._jobPostingRepository,
    this._secureLocalRepository,
    this.otherService,
    @factoryParam PageType pageType,
  ) {
    if (pageType == PageType.fetch) {
      fetchJobPostingsWithPagination();
    } else if (pageType == PageType.jobFollow) {
      fetchFavoriteJobPostingsWithPagination();
    } else if (pageType == PageType.detail) {
      fetchJobPostingDetailByUserType();
    } else if (pageType == PageType.filterForm) {
      _secureLocalRepository.deleteSecureData(StorageItem("selectedNationalities", "value"));
      fetchAllOtherData();
    } else if (pageType == PageType.filter) {
      _secureLocalRepository.deleteSecureData(StorageItem("selectedNationalities", "value"));
      fetchFilterJobPostingsWithPagination();
    } else if (pageType == PageType.update) {
      fetchMyJobPostingDetail();
      fetchAllOtherData();
    } else if (pageType == PageType.create) {
      fetchAllOtherData();
    }
  }

  Future fetchJobPostingsWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if (!isLastPage) {
      BaseListResponse response = await _jobPostingRepository.fetchJobPostings(pagingSize, pageNumber);
      if (response.isSuccess!) {
        isLastPage = response.data!.length < pagingSize;
        pageNumber++;
        allJobPostings.addAll(response.data! as List<JobPosting>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }

  Future fetchFavoriteJobPostingsWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if (!isFavoriteLastPage) {
      BaseListResponse response = await _jobPostingRepository.fetchFavoriteJobPostings(pagingSize, pageFavoriteNumber);
      if (response.isSuccess!) {
        isFavoriteLastPage = response.data!.length < pagingSize;
        pageFavoriteNumber++;
        allFavoriteJobPosting.addAll(response.data! as List<JobPosting>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }

  Future fetchFilterJobPostingsWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    await prepareFilterData();
    if (!isFilterLastPage) {
      filterData["pageNumber"] = pageFilterNumber.toString();
      BaseListResponse response = await _jobPostingRepository.fetchFilterJobPostings(filterData);
      if (response.isSuccess!) {
        isFilterLastPage = response.data!.length < pagingSize;
        pageFilterNumber++;
        filterData["pageNumber"] = pageFilterNumber.toString();
        allFilterJobPosting.addAll(response.data! as List<JobPosting>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }

  Future<JobDetail> fetchJobPostingDetail() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    String? id = await _secureLocalRepository.readSecureData("jobPostingId");
    jobDetail = await _jobPostingRepository.fetchJobPosting(int.parse(id!));
    networkStatus = jobDetail!.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return jobDetail!;
  }

  Future<JobDetail> fetchMyJobPostingDetail() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    jobDetail = await _jobPostingRepository.fetchRecruiterJobPosting();
    await _secureLocalRepository.writeSecureData(StorageItem("selectedNationalities", jobDetail!.nationality!));
    networkStatus = jobDetail!.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return jobDetail!;
  }

  Future<SuccessResponse> confirmJobPosting() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    SuccessResponse successResponse = await _jobPostingRepository.confirmJobPosting(jobDetail!.id!.toInt());
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return successResponse;
  }

  Future<JobPhone> fetchJobPostingPhone(int jobId) async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    JobPhone jobPhone = await _jobPostingRepository.findJobPostingPhone(jobId);
    networkStatus = jobPhone.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return jobPhone;
  }

  Future<SuccessResponse> applyJobPosting() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    SuccessResponse successResponse = await _jobPostingRepository.applyJobPosting(jobDetail!.id!.toInt());
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return successResponse;
  }

  Future<SuccessResponse> addFavoriteJob(JobPosting jobPosting) async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    SuccessResponse successResponse = await _jobPostingRepository.favoriteJobPosting(jobPosting.id!);
    jobPosting.favorite = true;
    await removeFavoriteJobPostingTheList(jobPosting);
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return successResponse;
  }

  Future<SuccessResponse> deleteFavoriteJob(JobPosting jobPosting) async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    SuccessResponse successResponse = await _jobPostingRepository.removeFavoriteJobPosting(jobPosting.id!);
    jobPosting.favorite = false;
    await removeFavoriteJobPostingTheList(jobPosting);
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return successResponse;
  }

  Future removeFavoriteJobPostingTheList(JobPosting jobPosting) async {
    if (allJobPostings.isNotEmpty) {
      allFavoriteJobPosting.remove(jobPosting);
    }
    if (allFavoriteJobPosting.isNotEmpty) {
      allFavoriteJobPosting.remove(jobPosting);
    }
  }

  Future fetchAllOtherData() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    await otherService.fetchCaretakerTypes();
    await otherService.fetchShiftSystems();
    await otherService.fetchAges();
    await otherService.fetchExperiences();
    await otherService.fetchNationalities();
    await otherService.fetchCities();
    await otherService.fetchDistricts(jobDetail != null ? jobDetail!.city! : "Adana");
    networkStatus = NetworkStatus.success;
    notifyListeners();
  }

  Future setSelectedCaretakerTypes(String value) async {
    otherService.selectedCaretakerType = value;
    notifyListeners();
  }

  Future setSelectedShiftSystem(String value) async {
    otherService.selectedShiftSystem = value;
    notifyListeners();
  }

  Future setSelectedAge(String value) async {
    otherService.selectedAge = value;
    notifyListeners();
  }

  Future setSelectedExperience(String value) async {
    otherService.selectedExperience = value;
    notifyListeners();
  }

  Future setSelectedNationality(String value) async {
    otherService.selectedNationality = value;
    notifyListeners();
  }

  Future setSelectedCity(String value) async {
    otherService.selectedCity = value;
    notifyListeners();
  }

  Future setSelectedDistrict(String value) async {
    otherService.selectedDistrict = value;
    notifyListeners();
  }

  Future updateDistrictByCity(String city) async {
    otherService.districts.clear();
    await otherService.fetchDistricts(city);
    notifyListeners();
  }

  Future prepareFilterData() async {
    filterData["caretakerType"] = (await _secureLocalRepository.readSecureData("caretakerType"))!;
    filterData["shiftSystem"] = (await _secureLocalRepository.readSecureData("shiftSystem"))!;
    filterData["experience"] = (await _secureLocalRepository.readSecureData("experience"))!;
    filterData["city"] = (await _secureLocalRepository.readSecureData("city"))!;
    filterData["district"] = (await _secureLocalRepository.readSecureData("district"))!;
    filterData["age"] = (await _secureLocalRepository.readSecureData("age"))!;
    filterData["gender"] = (await _secureLocalRepository.readSecureData("gender"))!;
    filterData["pagingSize"] = pagingSize.toString();
    filterData["nationality"] = (await _secureLocalRepository.readSecureData("selectedNationalities"))!;
  }

  Future saveFilterData() async {
    List<StorageItem> storageItems = [
      StorageItem("caretakerType", otherService.selectedCaretakerType ?? ""),
      StorageItem("shiftSystem", otherService.selectedShiftSystem ?? ""),
      StorageItem("experience", otherService.selectedExperience ?? ""),
      StorageItem("nationality", (await _secureLocalRepository.readSecureData("selectedNationalities"))?? ""),
      StorageItem("city", otherService.selectedCity ?? ""),
      StorageItem("age", otherService.selectedAge ?? ""),
      StorageItem("gender", otherService.gender ? "female" : "male"),
      StorageItem("district", otherService.selectedDistrict ?? ""),
    ];
    for (var item in storageItems) {
      _secureLocalRepository.writeSecureData(item);
    }
  }

  Future<bool?> setSelectedGender(bool p0) async {
    otherService.gender = p0;
    notifyListeners();
    return otherService.gender;
  }

  Future<JobPosting> createJobPosting() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    RecruiterJobPostingRequest? recruiterJobPostingRequest = RecruiterJobPostingRequest();
    recruiterJobPostingRequest.title = title?? jobDetail!.title;
    recruiterJobPostingRequest.caretakerType = otherService.selectedCaretakerType;
    recruiterJobPostingRequest.city = otherService.selectedCity;
    recruiterJobPostingRequest.district = otherService.selectedDistrict;
    recruiterJobPostingRequest.shiftSystem = otherService.selectedShiftSystem;
    recruiterJobPostingRequest.gender = !gender ? "female" : "male";
    recruiterJobPostingRequest.age = otherService.selectedAge;
    recruiterJobPostingRequest.nationality = await _secureLocalRepository.readSecureData("selectedNationalities");
    recruiterJobPostingRequest.desc = description;
    recruiterJobPostingRequest.experience = otherService.selectedExperience;

    JobPosting jobPosting = await _jobPostingRepository.createRecruiterJobPosting(recruiterJobPostingRequest);
    networkStatus = jobPosting.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    _secureLocalRepository.writeSecureData(StorageItem("jobPostingId", jobPosting.id!.toString()));
    notifyListeners();
    return jobPosting;
  }

  Future updateJobPosting() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    RecruiterJobPostingRequest? recruiterJobPostingRequest = RecruiterJobPostingRequest();
    recruiterJobPostingRequest.title = title?? jobDetail!.title;
    recruiterJobPostingRequest.caretakerType = otherService.selectedCaretakerType;
    recruiterJobPostingRequest.city = otherService.selectedCity;
    recruiterJobPostingRequest.district = otherService.selectedDistrict;
    recruiterJobPostingRequest.shiftSystem = otherService.selectedShiftSystem;
    recruiterJobPostingRequest.gender = gender ? "female" : "male";
    recruiterJobPostingRequest.age = otherService.selectedAge;
    recruiterJobPostingRequest.nationality =  await _secureLocalRepository.readSecureData("selectedNationalities");
    recruiterJobPostingRequest.desc = description?? jobDetail!.desc;
    recruiterJobPostingRequest.experience = otherService.selectedExperience;

    SuccessResponse successResponse = await _jobPostingRepository.updateRecruiterJobPosting(recruiterJobPostingRequest);
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return successResponse;
  }

  Future refresh() async {
    notifyListeners();
  }

  Future addNationalitySelectedList(List<String> x) async{
    selectedList =x;
    notifyListeners();
  }

  Future fetchJobPostingDetailByUserType() async {
    userType = await _secureLocalRepository.readSecureData("userType");
    if (userType == "applicant") {
      await fetchJobPostingDetail();
    } else {
      await fetchMyJobPostingDetail();
    }
  }

}
