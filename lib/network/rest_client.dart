import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/domain/request/auth/confirm_sms_request.dart';
import 'package:platform/domain/request/auth/register_request.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/request/job/recruiter_job_posting_request.dart';
import 'package:platform/domain/request/job/recruiter_job_posting_update.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/domain/response/applicant/find_applicant.dart';
import 'package:platform/domain/response/applicant_requests/applicant_request.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/domain/response/job/job_phone.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/domain/response/job/job_request.dart';
import 'package:platform/domain/response/job/recruiter_job_posting.dart';
import 'package:platform/domain/response/other/age.dart';
import 'package:platform/domain/response/other/caretaker_type.dart';
import 'package:platform/domain/response/other/city.dart';
import 'package:platform/domain/response/other/experience.dart';
import 'package:platform/domain/response/other/nationality.dart';
import 'package:platform/domain/response/other/shift_system.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://070f6af2-2bf4-403f-843f-a6c2e2452664.mock.pstmn.io")
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio) = _RestClient;

  // todo Auth

  @POST("/token")
  Future<Token> token(@Body() TokenRequest tokenRequest);

  @POST("/register")
  Future<Token> register(@Body() RegisterRequest registerRequest);

  @POST("/send_sms")
  Future<SuccessResponse> sendSms(@Body() SendSmsRequest sendSmsRequest);

  @POST("/confirm_sms")
  Future<SuccessResponse> sendConfirmSms(@Body() ConfirmSmsRequest confirmSmsRequest);

  // todo Job

  @GET("/job_postings")
  Future<List<JobPosting>> fetchJobPostings(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/job_postings")
  Future<List<JobPosting>> fetchJobPostingsFilter( @Queries() Map<String,String> queries);
      /*
      @Query("pageNumber") int pageNumber,
      @Query("pageSize") int pageSize,
      @Query("city") String city,
      @Query("district") String district,
      @Query("caretakerType") String caretakerType,
      @Query("shiftSystems") String shiftSystems,
      @Query("experience") int experience,
      @Query("nationality") String nationality,
      @Query("gender") bool gender);*/

  @GET("/job_postings/{id}")
  Future<JobDetail> fetchJobPosting(@Path("id") int jobId);

  @GET("/job_posting/{id}/get_phone")
  Future<JobPhone> fetchJobPostingPhone(@Path("id") int jobId);

  @GET("/find_jobs")
  Future<List<JobRequest>> findJobPostings(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @POST("/job_postings/{jobId}/apply")
  Future<SuccessResponse> jobPostingApply(@Path() int jobId);

  @POST("/job_postings/{jobId}/reject")
  Future<SuccessResponse> jobPostingReject(@Path() int jobId);

  @GET("/hire_jobs")
  Future<List<JobRequest>> findHirePostings(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @POST("/hire_jobs/{id}/apply")
  Future<SuccessResponse> applyHireJob(@Path("id") int hireId);

  @POST("/hire_jobs/{id}/reject")
  Future<SuccessResponse> rejectHireJob(@Path("id") int hireId);

  @GET("/my_job_posting")
  Future<RecruiterJobPosting> fetchMyJobPosting();

  @POST("/my_job_posting")
  Future<SuccessResponse> createMyJobPosting(@Body() RecruiterJobPostingRequest recruiterJobPostingRequest);

  @PUT("/my_job_posting")
  Future<SuccessResponse> updateMyJobPosting(@Body() RecruiterJobPostingUpdate recruiterJobPostingUpdate);

  // todo Applicant

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

  @GET("/find_applicants")
  Future<List<FindApplicant>> findApplicants(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/applicant_requests")
  Future<List<ApplicantRequest>> fetchApplicantRequests(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/applicant_requests/{id}/apply")
  Future<ApplicantRequest> applypplicantRequest();

  @GET("/applicant_requests/{id}/reject")
  Future<ApplicantRequest> rejectApplicantRequests();

  @POST("/applicant_profiles/{jobId}/request")
  Future applicantProfileRequest(@Path() int jobId);

  @POST('/applicant_profile')
  @MultiPart()
  Future<dynamic> createApplicantProfile({
    @Part() required String name,
    @Part() required String gender,
    @Part() required String city,
    @Part() required String title,
    @Part() required String district,
    @Part() required String caretakerType,
    @Part() required String shiftSystems,
    @Part() required String experience,
    @Part() required String nationality,
    @Part() required String age,
    @Part() required int description,
    @Part() required int smoking,
    @Part() required int travelRestriction,
    @Part() File? thumbnail,
  });

  @PUT('/applicant_profile')
  @MultiPart()
  Future<dynamic> updateApplicantProfile({
    @Part() required String name,
    @Part() required String gender,
    @Part() required String city,
    @Part() required String title,
    @Part() required String district,
    @Part() required String caretakerType,
    @Part() required String shiftSystems,
    @Part() required String experience,
    @Part() required String nationality,
    @Part() required String age,
    @Part() required int description,
    @Part() required int smoking,
    @Part() required int travelRestriction,
    @Part() File? thumbnail,
  });

  // todo Favorite

  @GET("/favorite_job_postings")
  Future<List<JobPosting>> fetchFavoriteJobPosting(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/favorite_applicant_profiles")
  Future<List<ApplicantProfile>> fetchFavoriteApplicantProfile();

  @POST("/applicant_profiles/{jobId}/favorite")
  Future addFavoriteApplicantProfile(@Path() int jobId);

  @POST("/job_postings/{jobId}/favorite")
  Future jobPostingAddFavorite(@Path() int jobId);

  // todo Other

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

  @GET("/cities")
  Future<List<City>> fetchCity();
}
