import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:peakabu/network/interceptor/error_interceptor.dart';
import 'package:peakabu/network/interceptor/log_interceptor.dart';
import 'package:peakabu/network/interceptor/token_interceptor.dart';
import 'package:peakabu/network/rest_client.dart';

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
    dio.interceptors.add(ErrorInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(LoggerInterceptor());
    }
    return dio;
  }

  @lazySingleton
  RestClient get restClient => RestClient(retrofitApi);

  @lazySingleton
  FlutterSecureStorage flutterSecureStorage() => const FlutterSecureStorage();
}
