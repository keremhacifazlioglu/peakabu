import 'package:platform/domain/request/job/recruiter_job_posting_request.dart';
import 'package:platform/domain/response/job/base_list_response.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/domain/response/job/job_phone.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/domain/response/success_response.dart';

abstract class IJobPostingRepository {
  Future<BaseListResponse> fetchJobPostings(int pageSize, int pageNumber);

  Future<JobDetail> fetchJobPosting(int jobId);

  Future<BaseListResponse> fetchFavoriteJobPostings(int pageSize, int pageNumber);

  Future<JobPhone> findJobPostingPhone(int jobId);

  Future<BaseListResponse> findRequestJobPostings(int pageSize, int pageNumber);

  Future<SuccessResponse> applyJobPosting(int jobId);

  Future<SuccessResponse> rejectJobPosting(int jobId);

  Future<BaseListResponse> findHirePostings(int pageSize, int pageNumber);

  Future<SuccessResponse> applyHireJob(int hireId);

  Future<SuccessResponse> rejectHireJob(int hireId);

  Future<JobDetail> fetchRecruiterJobPosting();

  Future<JobPosting> createRecruiterJobPosting(RecruiterJobPostingRequest recruiterJobPostingRequest);

  Future<SuccessResponse> updateRecruiterJobPosting(RecruiterJobPostingRequest recruiterJobPostingUpdate);

  Future<BaseListResponse> fetchFilterJobPostings(Map<String, String> queries);

  Future<SuccessResponse> favoriteJobPosting(int id);

  Future<SuccessResponse> removeFavoriteJobPosting(int id);

  Future<SuccessResponse> confirmJobPosting(int id);


}
