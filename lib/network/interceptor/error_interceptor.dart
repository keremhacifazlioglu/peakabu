// Dart imports:
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:platform/util/logger.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectionTimeout:
        throw TimeoutException(err.requestOptions);
      case DioErrorType.sendTimeout:
        throw TimeoutException(err.requestOptions);
      case DioErrorType.receiveTimeout:
        throw TimeoutException(err.requestOptions);
      case DioErrorType.badResponse:
        String? message;
        try {
          message = err.response?.data?["message"];
        } catch (e) {
          Log.e("Hata Mesajı çözülemedi");
        }
        if (message != null) {
          throw BaseError(message, err.requestOptions);
        }
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        switch (err.runtimeType) {
          case SocketException:
            throw BaseError("Soket Hatası", err.requestOptions);
          case FormatException:
            throw BaseError("Format Hatası", err.requestOptions);
          default:
            throw NoInternetConnectionException(err.requestOptions);
        }
      case DioErrorType.badCertificate:
        break;
      case DioErrorType.connectionError:
        break;
    }

    return super.onError(err, handler);
  }
}

class BaseError extends DioError {
  BaseError(this.text, RequestOptions r) : super(requestOptions: r);
  final String text;
  @override
  String toString() {
    return text;
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Bilinmeyen bir hata oluştu, lütfen daha sonra tekrar deneyin.';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'İnternet bağlantısı bulunamadı, tekrar deneyin.';
  }
}

class TimeoutException extends DioError {
  TimeoutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Bağlantı zaman aşımına uğradı.';
  }
}
