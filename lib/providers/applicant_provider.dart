import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/applicant_repository.dart';
import 'package:platform/service/other_service.dart';

@injectable
class ApplicantProvider with ChangeNotifier {
  final ApplicantRepository _applicantRepository;
  final OtherService otherService;
  ApplicantProfile? applicantProfile;
  NetworkStatus networkStatus = NetworkStatus.none;
  String? title, description, name;
  File? file;

  ApplicantProvider(this._applicantRepository, this.otherService) {
    fetchProfile();
    fetchAllOtherData();
  }

  Future<ApplicantProfile> fetchProfile() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    applicantProfile = await _applicantRepository.me();
    networkStatus = applicantProfile!.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
    return applicantProfile!;
  }

  Future createApplicantProfile() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    Map<String, dynamic> queries = {
      "name": "asdf",
      "gender":"female",
      "age": otherService.selectedAge!,
      "city": otherService.selectedCity!,
      "district": otherService.selectedCity!,
      "shiftSystem": otherService.selectedShiftSystem!,
      "nationality": otherService.selectedNationality!,
      "experience": otherService.selectedExperience!,
      "caretakerType": otherService.selectedCaretakerType!,
      "title": title ?? applicantProfile!.descTitle!,
      "description": description ?? applicantProfile!.desc!,
      "smoking": false,
      "travelRestriction": false,
      "thumbnail": file,
    };
    SuccessResponse successResponse = await _applicantRepository.createApplicantProfile(queries);
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
  }

  Future updateApplicantProfile() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    Map<String, dynamic> queries = {
      "name": "asdf",
      "gender":"female",
      "age": otherService.selectedAge!,
      "city": otherService.selectedCity!,
      "district": otherService.selectedCity!,
      "shiftSystem": otherService.selectedShiftSystem!,
      "nationality": otherService.selectedNationality!,
      "experience": otherService.selectedExperience!,
      "caretakerType": otherService.selectedCaretakerType!,
      "title": title ?? applicantProfile!.descTitle!,
      "description": description ?? applicantProfile!.desc!,
      "smoking": false,
      "travelRestriction": false,
      "thumbnail": file,
    };
    SuccessResponse successResponse = await _applicantRepository.updateApplicantProfile(queries);
    networkStatus = successResponse.isSuccess! ? NetworkStatus.success : NetworkStatus.error;
    notifyListeners();
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

  Future setProfileImage(String imagePath) async {
    file = File(imagePath);
    notifyListeners();
  }
}
