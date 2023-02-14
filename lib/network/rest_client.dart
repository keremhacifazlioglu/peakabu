import 'package:dio/dio.dart';
import 'package:platform/domain/response/job/job_posting.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://070f6af2-2bf4-403f-843f-a6c2e2452664.mock.pstmn.io")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/job_posting")
  Future<List<JobPosting>> fetchJobPosting(
    @Query("pageNumber") int pageNumber,
    @Query("pageSize") int pageSize,
  );
}
