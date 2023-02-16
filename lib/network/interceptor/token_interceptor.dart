import 'package:dio/dio.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Accept'] = 'application/vnd.pikabuu-api.v1+json';
    options.headers['Authorization'] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiYjQ3MmVmYzItYzEwNS00Yjk1LTk2NGEtZjA1NDdkYjIwOTAzIn0.M4xAgra7KIycDugECk07dOaB1RhFqDSStPXuJmPi578 ";
    return handler.next(options);
  }
}
