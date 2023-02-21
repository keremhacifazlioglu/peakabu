import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/domain/response/other/age.dart';
import 'package:platform/domain/response/other/caretaker_type.dart';
import 'package:platform/domain/response/other/city.dart';
import 'package:platform/domain/response/other/experience.dart';
import 'package:platform/domain/response/other/nationality.dart';
import 'package:platform/domain/response/other/shift_system.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/job_posting_repository.dart';
import 'package:platform/repository/other_repository.dart';
import 'package:platform/storage/secure_local_repository.dart';
import 'package:platform/storage/storage_item.dart';

@injectable
class JobPostingProvider with ChangeNotifier {
  final JobPostingRepository _jobPostingRepository;
  final OtherRepository _otherRepository;
  final SecureLocalRepository _secureLocalRepository;
  List<JobPosting> allJobPostings = [], allFavoriteJobPosting = [], allFilterJobPosting = [];
  bool isLastPage = false, isFavoriteLastPage = false, isFilterLastPage = false;
  int pagingSize = 10, pageNumber = 1, pageFavoriteNumber = 1, pageFilterNumber = 1;
  NetworkStatus networkStatus = NetworkStatus.none;
  JobDetail? jobDetail;
  Map<String, String> caretakerTypes = {},
      shiftSystems = {},
      ages = {},
      experiences = {},
      nationalities = {},
      cities = {},
      filterData = {};
  String? selectedCaretakerType,
      selectedShiftSystem,
      selectedExperience,
      selectedNationality,
      selectedCity,
      selectedAge;
  bool gender = true;

  JobPostingProvider(
      this._jobPostingRepository, this._otherRepository, this._secureLocalRepository, @factoryParam PageType pageType) {
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

  Future fetchAllOtherData() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    caretakerTypes = await fetchCaretakerTypes();
    shiftSystems = await fetchShiftSystems();
    ages = await fetchAges();
    experiences = await fetchExperiences();
    nationalities = await fetchNationalities();
    cities = await fetchCities();
    networkStatus = NetworkStatus.success;
    notifyListeners();
  }

  Future<Map<String, String>> fetchCaretakerTypes() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchCaretakerTypes();
    var response = baseListResponse.data! as List<CaretakerType>;
    selectedCaretakerType = response.first.value;
    for (var item in response) {
      caretakerTypes[item.key!] = item.value!;
    }
    return caretakerTypes;
  }

  Future setSelectedCaretakerTypes(String value) async {
    selectedCaretakerType = value;
    notifyListeners();
  }

  Future<Map<String, String>> fetchShiftSystems() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchShiftSystems();
    var response = baseListResponse.data! as List<ShiftSystem>;
    selectedShiftSystem = response.first.value;
    for (var item in response) {
      shiftSystems[item.key!] = item.value!;
    }
    return shiftSystems;
  }

  Future setSelectedShiftSystem(String value) async {
    selectedShiftSystem = value;
    notifyListeners();
  }

  Future<Map<String, String>> fetchAges() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchAges();
    var response = baseListResponse.data! as List<Age>;
    selectedAge = response.first.value;
    for (var item in response) {
      ages[item.key!] = item.value!;
    }
    return ages;
  }

  Future setSelectedAge(String value) async {
    selectedAge = value;
    notifyListeners();
  }

  Future<Map<String, String>> fetchExperiences() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchExperiences();
    var response = baseListResponse.data! as List<Experience>;
    selectedExperience = response.first.value;
    for (var item in response) {
      experiences[item.key!] = item.value!;
    }
    return experiences;
  }

  Future setSelectedExperience(String value) async {
    selectedExperience = value;
    notifyListeners();
  }

  Future<Map<String, String>> fetchNationalities() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchNationalities();
    var response = baseListResponse.data! as List<Nationality>;
    selectedNationality = response.first.value;
    for (var item in response) {
      nationalities[item.key!] = item.value!;
    }
    return nationalities;
  }

  Future setSelectedNationality(String value) async {
    selectedNationality = value;
    notifyListeners();
  }

  Future<Map<String, String>> fetchCities() async {
    BaseListResponse baseListResponse = await _otherRepository.fetchCities();
    var response = baseListResponse.data! as List<City>;
    selectedCity = response.first.value;
    for (var item in response) {
      cities[item.key!] = item.value!;
    }
    return cities;
  }

  Future setSelectedCity(String value) async {
    selectedCity = value;
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
      StorageItem("caretakerType", selectedCaretakerType ?? ""),
      StorageItem("shiftSystem", selectedShiftSystem ?? ""),
      StorageItem("experience", selectedExperience ?? ""),
      StorageItem("nationality", selectedNationality ?? ""),
      StorageItem("city", selectedCity ?? ""),
      StorageItem("age", selectedAge ?? ""),
      StorageItem("gender", gender ? "Kadın" : "Erkek"),
    ];
    for (var item in storageItems) {
      _secureLocalRepository.writeSecureData(item);
    }
  }

  Future<bool?> setSelectedGender(bool p0) async {
    gender = p0;
    notifyListeners();
    return gender;
  }
}
