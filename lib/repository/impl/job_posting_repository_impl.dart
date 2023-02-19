import 'package:platform/domain/request/job/recruiter_job_posting_request.dart';
import 'package:platform/domain/request/job/recruiter_job_posting_update.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/domain/response/job/job_phone.dart';
import 'package:platform/domain/response/job/recruiter_job_posting.dart';
import 'package:platform/domain/response/success_response.dart';

abstract class IJobPostingRepository {
  Future<BaseListResponse> fetchJobPostings(int pageSize, int pageNumber);

  Future<JobDetail> fetchJobPosting(int jobId);

  Future<BaseListResponse> fetchFavoriteJobPostings(
      int pageSize, int pageNumber);

  Future<JobPhone> findJobPostingPhone(int jobId);

  Future<BaseListResponse> findJobPostings(int pageSize, int pageNumber);

  Future<SuccessResponse> applyJobPosting(int jobId);

  Future<SuccessResponse> rejectJobPosting(int jobId);

  Future<BaseListResponse> findHirePostings(int pageSize, int pageNumber);

  Future<SuccessResponse> applyHireJob(int hireId);

  Future<SuccessResponse> rejectHireJob(int hireId);

  Future<RecruiterJobPosting> fetchRecruiterJobPosting();

  Future<SuccessResponse> createRecruiterJobPosting(
      RecruiterJobPostingRequest recruiterJobPostingRequest);
  Future<SuccessResponse> updateRecruiterJobPosting(
      RecruiterJobPostingUpdate recruiterJobPostingUpdate);
}
