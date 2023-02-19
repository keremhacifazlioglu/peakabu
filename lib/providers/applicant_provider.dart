import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/network/network_status.dart';
import 'package:platform/repository/applicant_repository.dart';

@injectable
class ApplicantProvider with ChangeNotifier {
  final ApplicantRepository _applicantRepository;
  ApplicantProfile? applicantProfile;
  NetworkStatus networkStatus = NetworkStatus.none;

  ApplicantProvider(this._applicantRepository) {
    fetchProfile();
  }

  Future<ApplicantProfile> fetchProfile() async {
    networkStatus = NetworkStatus.waiting;
    notifyListeners();
    applicantProfile = await _applicantRepository.me();
    networkStatus = applicantProfile!.isSuccess!
        ? NetworkStatus.success
        : NetworkStatus.error;
    notifyListeners();
    return applicantProfile!;
  }
}
