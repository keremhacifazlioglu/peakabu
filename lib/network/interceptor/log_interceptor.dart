// Package imports:
import 'package:dio/dio.dart';
import 'package:peakabu/util/logger.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var timestamp = "${DateTime.now().millisecondsSinceEpoch}";
    options.headers["timestamp"] = timestamp;

    Log.i("""--> 
    START REQUEST
    ${options.method} ${options.baseUrl}${options.path} 
    Content type: ${options.contentType}
    QueryParameters : ${options.queryParameters}
    Headers : ${options.headers}
    Data : ${options.data}
    <-- END REQUEST""", tag: timestamp);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.d("""--> 
    START RESPONSE
    Time ${DateTime.now().millisecondsSinceEpoch - int.parse(response.requestOptions.headers["timestamp"])} ms
    ${response.requestOptions.method} - ${response.requestOptions.baseUrl}${response.requestOptions.path} - ${response.statusCode}
    ${response.data.toString().trim()}
    <-- END RESPONSE""",
        tag: response.requestOptions.headers["timestamp"].toString());

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Log.e("""--> 
    START ERROR
    ${err.type}
    ${err.requestOptions.method} - ${err.requestOptions.baseUrl}${err.requestOptions.path} - ${err.response?.statusCode}
    ${err.requestOptions.headers}
    ${err.requestOptions.data}
    ${err.response?.data.toString().trim()}
    <-- END ERROR""", tag: err.requestOptions.headers["timestamp"].toString());

    return super.onError(err, handler);
  }
}
