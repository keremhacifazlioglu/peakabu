import 'package:dio/dio.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = "Bearer asdsadasd";
    return handler.next(options);
  }
}
