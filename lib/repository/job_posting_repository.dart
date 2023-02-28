import 'package:injectable/injectable.dart';
import 'package:platform/domain/request/job/recruiter_job_posting_update.dart';
import 'package:platform/domain/request/job/recruiter_job_posting_request.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/domain/response/job/job_request.dart';
import 'package:platform/domain/response/job/recruiter_job_posting.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/domain/response/job/job_phone.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/interceptor/error_interceptor.dart';
import 'package:platform/network/rest_client.dart';
import 'package:platform/repository/impl/job_posting_repository_impl.dart';

@injectable
class JobPostingRepository extends IJobPostingRepository {
  final RestClient _restClient;

  JobPostingRepository(this._restClient);

  @override
  Future<BaseListResponse> fetchJobPostings(
      int pageSize, int pageNumber) async {
    BaseListResponse<JobPosting> baseListResponse = BaseListResponse();
    try {
      List<JobPosting> response =
          await _restClient.fetchJobPostings(pageNumber, pageSize);
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchFavoriteJobPostings(
      int pageSize, int pageNumber) async {
    BaseListResponse<JobPosting> baseListResponse = BaseListResponse();
    try {
      List<JobPosting> response =
          await _restClient.fetchFavoriteJobPosting(pageNumber, pageSize);
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<BaseListResponse> fetchFilterJobPostings(Map<String,String> queries) async {
    BaseListResponse<JobPosting> baseListResponse = BaseListResponse();
    try {
      List<JobPosting> response =
      await _restClient.fetchJobPostingsFilter(queries);
      baseListResponse.data = response;
      baseListResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<JobDetail> fetchJobPosting(int jobId) async {
    JobDetail jobDetail = JobDetail();
    try {
      jobDetail = await _restClient.fetchJobPosting(jobId);
      jobDetail.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      jobDetail.message = e.text;
      jobDetail.status = e.response!.statusCode;
      jobDetail.isSuccess = false;
    }
    return jobDetail;
  }

  @override
  Future<JobPhone> findJobPostingPhone(int jobId) async {
    JobPhone jobPhone = JobPhone();
    try {
      jobPhone = await _restClient.fetchJobPostingPhone(jobId);
    } on CustomGenericDioError catch (e) {
      jobPhone.message = e.text;
      jobPhone.status = e.response!.statusCode;
      jobPhone.isSuccess = false;
    }
    return jobPhone;
  }

  @override
  Future<BaseListResponse> findHirePostings(
      int pageSize, int pageNumber) async {
    BaseListResponse baseListResponse = BaseListResponse();
    try {
      List<JobRequest> response =
          await _restClient.findHirePostings(pageNumber, pageSize);
      baseListResponse.data = response;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<SuccessResponse> applyHireJob(int hireId) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.applyHireJob(hireId);
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<SuccessResponse> rejectHireJob(int hireId) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.rejectHireJob(hireId);
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<BaseListResponse> findJobPostings(int pageSize, int pageNumber) async {
    BaseListResponse baseListResponse = BaseListResponse();
    try {
      List<JobRequest> response =
          await _restClient.findJobPostings(pageNumber, pageSize);
      baseListResponse.data = response;
      baseListResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      baseListResponse.message = e.text;
      baseListResponse.status = e.response!.statusCode;
      baseListResponse.isSuccess = false;
    }
    return baseListResponse;
  }

  @override
  Future<SuccessResponse> applyJobPosting(int jobId) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.jobPostingApply(jobId);
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<SuccessResponse> rejectJobPosting(int jobId) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.jobPostingReject(jobId);
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<SuccessResponse> createRecruiterJobPosting(
      RecruiterJobPostingRequest recruiterJobPostingRequest) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse =
          await _restClient.createMyJobPosting(recruiterJobPostingRequest);
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<SuccessResponse> updateRecruiterJobPosting(
      RecruiterJobPostingUpdate recruiterJobPostingUpdate) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse =
          await _restClient.updateMyJobPosting(recruiterJobPostingUpdate);
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<JobDetail> fetchRecruiterJobPosting() async {
    JobDetail jobDetail = JobDetail();
    try {
      jobDetail = await _restClient.fetchMyJobPosting();
      jobDetail.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      jobDetail.message = e.text;
      jobDetail.status = e.response!.statusCode;
      jobDetail.isSuccess = false;
    }
    return jobDetail;
  }

  @override
  Future<SuccessResponse> favoriteJobPosting(int id) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.jobPostingAddFavorite(id);
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }
}
