import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/domain/response/success_response.dart';

abstract class IApplicantRepository {

  Future<ApplicantProfile> me();
  Future<SuccessResponse>  updateApplicantProfile(Map<String,dynamic> queries);
  Future<SuccessResponse>  createApplicantProfile(Map<String,dynamic> queries);
}
