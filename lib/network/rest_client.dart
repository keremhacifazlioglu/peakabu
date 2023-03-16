import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/domain/request/auth/confirm_sms_request.dart';
import 'package:platform/domain/request/auth/register_request.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/request/job/recruiter_job_posting_request.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/domain/response/applicant_requests/applicant_request.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/domain/response/job/job_detail.dart';
import 'package:platform/domain/response/job/job_phone.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:platform/domain/response/job/job_request.dart';
import 'package:platform/domain/response/other/age.dart';
import 'package:platform/domain/response/other/caretaker_type.dart';
import 'package:platform/domain/response/other/city.dart';
import 'package:platform/domain/response/other/district.dart';
import 'package:platform/domain/response/other/experience.dart';
import 'package:platform/domain/response/other/nationality.dart';
import 'package:platform/domain/response/other/shift_system.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://api.pikabu.io/api/v1")
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

  @GET("/applicant/recruiter_jobs")
  Future<List<JobPosting>> fetchJobPostings(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/applicant/recruiter_jobs")
  Future<List<JobPosting>> fetchJobPostingsFilter(@Queries() Map<String, String> queries);

  @GET("/applicant/recruiter_jobs/{id}")
  Future<JobDetail> fetchJobPosting(@Path("id") int jobId);

  @GET("/applicant/recruiter_jobs/{id}/get_phone")
  Future<JobPhone> fetchJobPostingPhone(@Path("id") int jobId);

  @GET("/applicant/recruiter_jobs/requested")
  Future<List<JobRequest>> findRequestJobPostings(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @POST("/applicant/recruiter_jobs/{jobId}/apply")
  Future<SuccessResponse> jobPostingApply(@Path() int jobId);

  @POST("/applicant/recruiter_jobs/{jobId}/reject")
  Future<SuccessResponse> jobPostingReject(@Path() int jobId);

  @GET("/applicant/recruiter_jobs/invited")
  Future<List<JobRequest>> findHirePostings(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @POST("/hire_jobs/{id}/apply")
  Future<SuccessResponse> applyHireJob(@Path("id") int hireId);

  @POST("/hire_jobs/{id}/reject")
  Future<SuccessResponse> rejectHireJob(@Path("id") int hireId);

  @GET("/my_job_posting")
  Future<JobDetail> fetchMyJobPosting();

  @POST("/my_job_posting")
  Future<SuccessResponse> createMyJobPosting(@Body() RecruiterJobPostingRequest recruiterJobPostingRequest);

  @PUT("/my_job_posting")
  Future<SuccessResponse> updateMyJobPosting(@Body() RecruiterJobPostingRequest recruiterJobPostingRequest);

  // todo Applicant

  @GET("/applicant_profiles")
  Future<List<ApplicantProfile>> fetchApplicantProfiles(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/applicant_profiles")
  Future<List<ApplicantProfile>> fetchApplicantProfilesFilter(@Queries() Map<String, String> queries);

  @GET("/applicant_profiles/{id}")
  Future<ApplicantProfile> fetchApplicantProfile(@Path("id") int applicantId);

  @GET("/applicant_profiles/{id}/get_phone")
  Future<ApplicantProfile> fetchApplicantPhone(@Path("id") int applicantId);

  @GET("/applicant/applicant_profiles/me")
  Future<ApplicantProfile> me();

  @GET("/find_applicants")
  Future<List<ApplicantRequest>> findApplicants(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/applicant_requests")
  Future<List<ApplicantRequest>> fetchApplicantRequests(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @GET("/applicant_requests/{id}/apply")
  Future<ApplicantRequest> applyApplicantRequest();

  @GET("/applicant_requests/{id}/reject")
  Future<ApplicantRequest> rejectApplicantRequests();

  @POST("/applicant_profiles/{jobId}/request")
  Future applicantProfileRequest(@Path() int jobId);

  @POST('/applicant_profile')
  @MultiPart()
  Future<SuccessResponse> createApplicantProfile({
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
    @Part() required String description,
    @Part() File? thumbnail,
  });

  @PUT('/applicant_profile')
  @MultiPart()
  Future<SuccessResponse> updateApplicantProfile({
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
    @Part() required String description,
    @Part() File? thumbnail,
  });

  // todo Favorite

  @GET("/applicant/recruiter_jobs/favorites")
  Future<List<JobPosting>> fetchFavoriteJobPosting(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @POST("/applicant/recruiter_jobs/{jobId}/favorite")
  Future<SuccessResponse> jobPostingAddFavorite(@Path() int jobId);

  @DELETE("/applicant/recruiter_jobs/{jobId}/favorite")
  Future<SuccessResponse> jobPostingRemoveFavorite(@Path() int jobId);

  @GET("/favorite_applicant_profiles")
  Future<List<ApplicantProfile>> fetchFavoriteApplicantProfile(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );

  @POST("/applicant_profiles/{jobId}/favorite")
  Future addFavoriteApplicantProfile(@Path() int jobId);

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

  @GET("/districts")
  Future<List<District>> fetchDistricts(@Query("city") String city);
}
