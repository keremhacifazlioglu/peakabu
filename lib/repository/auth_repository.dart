import 'package:injectable/injectable.dart';
import 'package:platform/domain/request/auth/confirm_sms_request.dart';
import 'package:platform/domain/request/auth/register_request.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/response/auth/send_sms.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/interceptor/error_interceptor.dart';
import 'package:platform/network/rest_client.dart';
import 'package:platform/repository/impl/auth_repository_impl.dart';

@injectable
class AuthRepository implements IAuthRepository {
  final RestClient _restClient;

  AuthRepository(this._restClient);

  @override
  Future<SuccessResponse> register(RegisterRequest registerRequest) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.register(registerRequest);
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<SendSms> sendSms(SendSmsRequest sendSmsRequest) async {
    SendSms successResponse = SendSms();
    try {
      successResponse = await _restClient.sendSms(sendSmsRequest);
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<SuccessResponse> confirmSms(ConfirmSmsRequest confirmSmsRequest) async {
    SuccessResponse successResponse = SuccessResponse();
    try {
      successResponse = await _restClient.sendConfirmSms(confirmSmsRequest);
      successResponse.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      successResponse.message = e.text;
      successResponse.status = e.response!.statusCode;
      successResponse.isSuccess = false;
    }
    return successResponse;
  }

  @override
  Future<Token?> token(TokenRequest tokenRequest) async {
    Token token = Token();
    try {
      token = await _restClient.token(tokenRequest);
      token.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      token.message = e.text;
      token.status = e.response != null ? e.response!.statusCode : e.statusCode;
      token.isSuccess = false;
    }
    return token;
  }
}
