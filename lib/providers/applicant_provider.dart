import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/cons/page_type.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/applicant_repository.dart';
import 'package:platform/service/other_service.dart';
import 'package:platform/storage/secure_local_repository.dart';

@injectable
class ApplicantProvider with ChangeNotifier {
  final ApplicantRepository _applicantRepository;
  final SecureLocalRepository _secureLocalRepository;
  final OtherService otherService;
  ApplicantProfile? applicantProfile;
  List<ApplicantProfile> allApplicantProfile = [], allFavoriteApplicantProfile = [], allFilterApplicantProfile = [];
  NetworkStatus networkStatus = NetworkStatus.none;
  String? title, description, name;
  File? file;
  int pageNumber = 1, pageFavoriteNumber = 1, pageFilterNumber = 1, pagingSize = 10;
  bool isLastPage = false, isFavoriteLastPage = false, isFilterLastPage = false;

  Map<String, String> filterData = {};

  ApplicantProvider(
      this._applicantRepository, this._secureLocalRepository, this.otherService, @factoryParam PageType pageType) {
    if (pageType == PageType.fetch) {
      fetchApplicantProfilesWithPagination();
      fetchFavoriteApplicantWithPagination();
    } else if (pageType == PageType.detail) {
      fetchProfile();
    } else if (pageType == PageType.filterForm) {
      fetchAllOtherData();
    } else if (pageType == PageType.filter) {
      fetchFilterJobPostingsWithPagination();
    } else if (pageType == PageType.update) {
      fetchProfile();
      fetchAllOtherData();
    }else if (pageType == PageType.create) {
      fetchAllOtherData();
    }
  }

  Future<ApplicantProfile> fetchProfile() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    applicantProfile = await _applicantRepository.me();
    networkStatus = applicantProfile!.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return applicantProfile!;
  }

  Future<List<ApplicantProfile>> fetchApplicantProfilesWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if (!isLastPage) {
      BaseListResponse response = await _applicantRepository.fetchApplicantProfiles(pagingSize, pageNumber);
      if (response.isSuccess!) {
        isLastPage = response.data!.length < pagingSize;
        pageNumber++;
        allApplicantProfile.addAll(response.data! as List<ApplicantProfile>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
    return allApplicantProfile;
  }

  Future fetchFavoriteApplicantWithPagination() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    if (!isFavoriteLastPage) {
      BaseListResponse response =
          await _applicantRepository.fetchFavoriteApplicantProfiles(pagingSize, pageFavoriteNumber);
      if (response.isSuccess!) {
        isFavoriteLastPage = response.data!.length < pagingSize;
        pageFavoriteNumber++;
        allFavoriteApplicantProfile.addAll(response.data! as List<ApplicantProfile>);
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
      BaseListResponse response = await _applicantRepository.fetchFilterApplicantProfiles(filterData);
      if (response.isSuccess!) {
        isFilterLastPage = response.data!.length < pagingSize;
        pageFilterNumber++;
        filterData["pageNumber"] = pageFilterNumber.toString();
        allFilterApplicantProfile.addAll(response.data! as List<ApplicantProfile>);
        networkStatus = NetworkStatus.success;
      } else {
        networkStatus = NetworkStatus.error;
      }
    } else {
      networkStatus = NetworkStatus.success;
    }
    notifyListeners();
  }

  Future<SuccessResponse> createApplicantProfile() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    Map<String, dynamic> queries = {
      "name": applicantProfile!.name,
      "gender": applicantProfile!.gender!,
      "age": otherService.selectedAge!,
      "city": otherService.selectedCity!,
      "district": otherService.selectedCity!,
      "shiftSystem": otherService.selectedShiftSystem!,
      "nationality": otherService.selectedNationality!,
      "experience": otherService.selectedExperience!,
      "caretakerType": otherService.selectedCaretakerType!,
      "title": title ?? applicantProfile!.title!,
      "description": description ?? applicantProfile!.desc!,
      "thumbnail": file,
    };
    SuccessResponse successResponse = await _applicantRepository.createApplicantProfile(queries);
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return successResponse;
  }

  Future<SuccessResponse> updateApplicantProfile() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    Map<String, dynamic> queries = {
      "name": applicantProfile!.name,
      "gender": applicantProfile!.gender!,
      "age": otherService.selectedAge!,
      "city": otherService.selectedCity!,
      "district": otherService.selectedCity!,
      "shiftSystem": otherService.selectedShiftSystem!,
      "nationality": otherService.selectedNationality!,
      "experience": otherService.selectedExperience!,
      "caretakerType": otherService.selectedCaretakerType!,
      "title": title ?? applicantProfile!.title!,
      "description": description ?? applicantProfile!.desc!,
      "thumbnail": file ?? "",
    };
    SuccessResponse successResponse = await _applicantRepository.updateApplicantProfile(queries);
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
    await otherService.fetchDistricts("Adana");
    networkStatus = NetworkStatus.success;
    notifyListeners();
  }

  Future prepareFilterData() async {
    filterData["caretakerType"] = (await _secureLocalRepository.readSecureData("caretakerType"))!;
    filterData["shiftSystem"] = (await _secureLocalRepository.readSecureData("shiftSystem"))!;
    filterData["experience"] = (await _secureLocalRepository.readSecureData("experience"))!;
    filterData["nationality"] = (await _secureLocalRepository.readSecureData("nationality"))!;
    filterData["city"] = (await _secureLocalRepository.readSecureData("city"))!;
    filterData["district"] = (await _secureLocalRepository.readSecureData("district"))!;
    filterData["age"] = (await _secureLocalRepository.readSecureData("age"))!;
    filterData["gender"] = (await _secureLocalRepository.readSecureData("gender"))!;
    filterData["pagingSize"] = pagingSize.toString();
  }

  Future setProfileImage(String imagePath) async {
    file = File(imagePath);
    notifyListeners();
  }

  Future refresh() async {
    notifyListeners();
  }
}
