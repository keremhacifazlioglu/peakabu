import 'package:injectable/injectable.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/interceptor/error_interceptor.dart';
import 'package:platform/repository/impl/applicant_repository_impl.dart';

import '../network/rest_client.dart';

@injectable
class ApplicantRepository implements IApplicantRepository {
  final RestClient _restClient;

  ApplicantRepository(this._restClient);

  @override
  Future<ApplicantProfile> me() async {
    ApplicantProfile applicantProfile = ApplicantProfile();
    try {
      applicantProfile = await _restClient.me();
      applicantProfile.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      applicantProfile.message = e.text;
      applicantProfile.status = e.response!.statusCode;
      applicantProfile.isSuccess = false;
    }
    return applicantProfile;
  }

  @override
  Future<SuccessResponse> updateApplicantProfile(Map<String, dynamic> queries) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.updateApplicantProfile(
        name: queries['name'],
        gender: queries['gender'],
        city: queries['city'],
        title: queries['title'],
        district: queries['district'],
        caretakerType: queries['caretakerType'],
        shiftSystems: queries['shiftSystem'],
        experience: queries['experience'],
        nationality: queries['nationality'],
        age: queries['age'],
        description: queries['description'],
      );
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<SuccessResponse> createApplicantProfile(Map<String, dynamic> queries) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.createApplicantProfile(
        name: queries['name'],
        gender: queries['gender'],
        city: queries['city'],
        title: queries['title'],
        district: queries['district'],
        caretakerType: queries['caretakerType'],
        shiftSystems: queries['shiftSystem'],
        experience: queries['experience'],
        nationality: queries['nationality'],
        age: queries['age'],
        description: queries['description'],
      );
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }
}
