import 'package:dio/dio.dart';
import 'package:platform/config/locator.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Accept'] = 'application/vnd.pikabuu-api.v1+json';
    options.headers['Content-Type'] = 'application/json';
    String? token = await secureLocalRepository.readSecureData("token");
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer ${await secureLocalRepository.readSecureData("token")}";
    }
    return handler.next(options);
  }

}
