import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:platform/network/interceptor/log_interceptor.dart';
import 'package:platform/network/interceptor/token_interceptor.dart';
import 'package:platform/network/rest_client.dart';

@module
abstract class AppModule {

  @lazySingleton
  Dio get retrofitApi {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://070f6af2-2bf4-403f-843f-a6c2e2452664.mock.pstmn.io",
      ),
    );
    dio.interceptors.add(TokenInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(LoggerInterceptor());
    }
    return dio;
  }

  @lazySingleton
  RestClient get injectRestClient=> RestClient(retrofitApi);

}