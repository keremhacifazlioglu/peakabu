import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/domain/request/auth/confirm_sms_request.dart';
import 'package:platform/domain/request/auth/register_request.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/request/job/my_job_posting_request.dart';
import 'package:platform/domain/request/job/my_job_posting_update.dart';
import 'package:platform/domain/response/applicant/applicant_profile.dart';
import 'package:platform/domain/response/applicant/find_applicant.dart';
import 'package:platform/domain/response/applicant_requests/applicant_request.dart';
import 'package:platform/domain/response/auth/confirm_sms.dart';
import 'package:platform/domain/response/auth/token.dart';
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
import 'package:platform/domain/response/success_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://070f6af2-2bf4-403f-843f-a6c2e2452664.mock.pstmn.io")
abstract class RestClient {
  @factoryMethod
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

  @POST("/send_sms")
  Future<SuccessResponse> sendSms(@Body() SendSmsRequest sendSmsRequest);

  @POST("/confirm_sms")
  Future<ConfirmSms> sendConfirmSms(
      @Body() ConfirmSmsRequest confirmSmsRequest);

  @POST("/register")
  Future<Token> register(@Body() RegisterRequest registerRequest);

  @POST("/token")
  Future<Token> token(@Body() TokenRequest tokenRequest);

  @POST("/job_postings/{jobId}/favorite")
  Future jobPostingAddFavorite(@Path() int jobId);

  @POST("/job_postings/{jobId}/apply")
  Future jobPostingApply(@Path() int jobId);

  @POST("/job_postings/{jobId}/reject")
  Future jobPostingReject(@Path() int jobId);

  @POST("/my_job_posting")
  Future createMyJobPosting(@Body() MyJobPostingRequest myJobPostingRequest);

  @PUT("/my_job_posting")
  Future updateMyJobPosting(@Body() MyJobPostingUpdate myJobPostingUpdate);

  @POST("/applicant_profiles/{jobId}/favorite")
  Future addFavoriteApplicantProfile(@Path() int jobId);

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
}
