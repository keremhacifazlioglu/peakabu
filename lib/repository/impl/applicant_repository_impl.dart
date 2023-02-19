import 'package:platform/domain/response/applicant/applicant_profile.dart';

abstract class IApplicantRepository {
  Future<ApplicantProfile> me();
}
