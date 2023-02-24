import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/job/job_detail.dart';
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
  bool isLastPage = false, isFavoriteLastPage = false, isFilterLastPage = false;
  int pagingSize = 10, pageNumber = 1, pageFavoriteNumber = 1, pageFilterNumber = 1;
  NetworkStatus networkStatus = NetworkStatus.none;
  JobDetail? jobDetail;
  Map<String, String> filterData = {};


  JobPostingProvider(
      this._jobPostingRepository,this._secureLocalRepository, this.otherService, @factoryParam PageType pageType) {
    if (pageType == PageType.fetch) {
      fetchJobPostingsWithPagination();
      fetchFavoriteJobPostingsWithPagination();
    } else if (pageType == PageType.detail) {
      fetchJobPostingDetail();
    } else if (pageType == PageType.filterForm) {
      fetchAllOtherData();
    } else if (pageType == PageType.filter) {
      fetchFilterJobPostingsWithPagination();
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
    jobDetail = await _jobPostingRepository.fetchJobPosting(1);
    networkStatus = jobDetail!.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return jobDetail!;
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
    SuccessResponse successResponse = await _jobPostingRepository.favoriteJobPosting(1);
    jobPosting.follow = successResponse.follow;

    if(!successResponse.follow! && allJobPostings.isNotEmpty){
      allFavoriteJobPosting.remove(jobPosting);
    }
    if(!successResponse.follow! && allFavoriteJobPosting.isNotEmpty){
      allFavoriteJobPosting.remove(jobPosting);
    }
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return successResponse;
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

  Future prepareFilterData() async {
    filterData["caretakerType"] = (await _secureLocalRepository.readSecureData("caretakerType"))!;
    filterData["shiftSystem"] = (await _secureLocalRepository.readSecureData("shiftSystem"))!;
    filterData["experience"] = (await _secureLocalRepository.readSecureData("experience"))!;
    filterData["nationality"] = (await _secureLocalRepository.readSecureData("nationality"))!;
    filterData["city"] = (await _secureLocalRepository.readSecureData("city"))!;
    filterData["age"] = (await _secureLocalRepository.readSecureData("age"))!;
    filterData["gender"] = (await _secureLocalRepository.readSecureData("gender"))!;
    filterData["pagingSize"] = pagingSize.toString();
  }

  Future saveFilterData() async {
    List<StorageItem> storageItems = [
      StorageItem("caretakerType", otherService.selectedCaretakerType ?? ""),
      StorageItem("shiftSystem", otherService.selectedShiftSystem ?? ""),
      StorageItem("experience", otherService.selectedExperience ?? ""),
      StorageItem("nationality", otherService.selectedNationality ?? ""),
      StorageItem("city", otherService.selectedCity ?? ""),
      StorageItem("age", otherService.selectedAge ?? ""),
      StorageItem("gender", otherService.gender ? "female" : "male"),
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



}
