import 'package:dio/dio.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/domain/response/applicant/find_applicant.dart';
import 'package:platform/domain/response/applicant_requests/applicant_request.dart';
import 'package:platform/domain/response/favorite/favorite_job_posting.dart';
import 'package:platform/domain/response/job/find_job.dart';
import 'package:platform/domain/response/job/hire_job.dart';
import 'package:platform/domain/response/job/job_phone.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/domain/response/job/my_job_posting.dart';
import 'package:platform/domain/response/other/age.dart';
import 'package:platform/domain/response/other/caretaker_type.dart';
import 'package:platform/domain/response/other/experience.dart';
import 'package:platform/domain/response/other/nationality.dart';
import 'package:platform/domain/response/other/shift_system.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://070f6af2-2bf4-403f-843f-a6c2e2452664.mock.pstmn.io")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/job_posting")
  Future<List<JobPosting>> fetchJobPostings(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/job_posting/{id}")
  Future<JobPosting> fetchJobPosting(@Path("id") int jobId);

  @GET("/job_posting/{id}/get_phone")
  Future<JobPhone> fetchJobPostingPhone(@Path("id") int jobId);

  @GET("/my_job_posting")
  Future<MyJobPosting> fetchMyJobPosting();

  @GET("/applicant_profiles")
  Future<List<ApplicantProfile>> fetchApplicantProfiles(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/applicant_profiles/{id}")
  Future<ApplicantProfile> fetchApplicantProfile(@Path("id") int applicantId);

  @GET("/applicant_profiles/{id}/get_phone")
  Future<ApplicantProfile> fetchApplicantPhone(@Path("id") int applicantId);

  @GET("/applicant_profile")
  Future<ApplicantProfile> me();

  @GET("/find_jobs")
  Future<List<FindJob>> findJobPostings(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/hire_jobs")
  Future<HireJob> findHirePostings(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/hire_jobs/{id}/apply")
  Future<HireJob> applyHireJob(@Path("id") int hireId);

  @GET("/hire_jobs/{id}/reject")
  Future<HireJob> rejectHireJob(@Path("id") int hireId);

  @GET("/find_applicants")
  Future<List<FindApplicant>> findApplicants(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/applicant_requets")
  Future<List<ApplicantRequest>> fetchApplicantRequests(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/applicant_requets/{id}/apply")
  Future<ApplicantRequest> applypplicantRequest();

  @GET("/applicant_requets/{id}/reject")
  Future<ApplicantRequest> rejectApplicantRequests();

  @GET("/favorite_job_postings")
  Future<List<FavoriteJobPosting>> fetchFavoriteJobPosting();

  @GET("/favorite_applicant_profiles")
  Future<List<ApplicantProfile>> fetchFavoriteApplicantProfile();

  @GET("/caretaker_types")
  Future<List<CaretakerType>> fetchCaretakerTypes();

  @GET("/shift_systems")
  Future<List<ShiftSystem>> fetchShiftSystems();

  @GET("/experiences")
  Future<List<Experience>> fetchExperiences();

  @GET("/nationalities")
  Future<List<Nationality>> fetchNationalities();

  @GET("/ages")
  Future<List<Age>> fetchAges();
}
