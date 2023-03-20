import 'package:injectable/injectable.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/domain/response/applicant_requests/applicant_request.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/job/job_detail.dart';
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
      applicantProfile.status = e.response.statusCode;
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
        shiftSystem: queries['shiftSystem'],
        experience: queries['experience'],
        nationality: queries['nationality'],
        age: queries['age'],
        desc: queries['description'],
        image: queries['image'],
      );
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response.statusCode;
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
          shiftSystem: queries['shiftSystem'],
          experience: queries['experience'],
          nationality: queries['nationality'],
          age: queries['age'],
          desc: queries['desc'],
          image: queries['image']);
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<BaseListResponse> fetchApplicantProfiles(int pageNumber, int pageSize) async {
    BaseListResponse baseListResponse = BaseListResponse();
    try {
      List<ApplicantProfile> response = await _restClient.fetchApplicantProfiles(pageNumber, pageSize);
      baseListResponse.data = response;
      baseListResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchFavoriteApplicantProfiles(int pageNumber, int pageSize) async {
    BaseListResponse baseListResponse = BaseListResponse();
    try {
      List<ApplicantProfile> response = await _restClient.fetchFavoriteApplicantProfile();
      baseListResponse.data = response;
      baseListResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchFilterApplicantProfiles(Map<String, String> queries) async {
    BaseListResponse<ApplicantProfile> baseListResponse = BaseListResponse();
    try {
      List<ApplicantProfile> response = await _restClient.fetchApplicantProfilesFilter(queries);
      baseListResponse.data = response;
      baseListResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> applicantRequests(int pageNumber, int pageSize) async {
    BaseListResponse<ApplicantRequest> baseListResponse = BaseListResponse();
    try {
      List<ApplicantRequest> response = await _restClient.fetchApplicantRequests(pageNumber, pageSize);
      baseListResponse.data = response;
      baseListResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> findApplicants(int pageNumber, int pageSize) async {
    BaseListResponse<ApplicantRequest> baseListResponse = BaseListResponse();
    try {
      List<ApplicantRequest> response = await _restClient.findApplicants(pageNumber, pageSize);
      baseListResponse.data = response;
      baseListResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<JobDetail> fetchMyJobPosting() async {
    JobDetail jobDetail = JobDetail();
    try {
      jobDetail = await _restClient.fetchMyJobPosting();
      jobDetail.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      jobDetail.message = e.text;
      jobDetail.status = e.response.statusCode;
      jobDetail.isSuccess = false;
    }
    return jobDetail;
  }

  @override
  Future<ApplicantProfile> fetchApplicantProfile(int id) async {
    ApplicantProfile applicantProfile = ApplicantProfile();
    try {
      applicantProfile = await _restClient.fetchApplicantProfile(id);
      applicantProfile.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      applicantProfile.message = e.text;
      applicantProfile.status = e.response.statusCode;
      applicantProfile.isSuccess = false;
    }
    return applicantProfile;
  }

  @override
  Future<SuccessResponse> favoriteApplicantProfile(int id) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.addFavoriteApplicantProfile(id);
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<SuccessResponse> removeFavoriteApplicantProfile(int id) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.removeFavoriteApplicantProfile(id);
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }
}
