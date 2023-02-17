import 'package:injectable/injectable.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/domain/response/auth/confirm_sms.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/request/auth/register_request.dart';
import 'package:platform/domain/request/auth/confirm_sms_request.dart';
import 'package:platform/domain/response/success_response.dart';
import 'package:platform/network/interceptor/error_interceptor.dart';
import 'package:platform/network/rest_client.dart';
import 'package:platform/repository/impl/auth_repository_impl.dart';

@injectable
class AuthRepository implements IAuthRepository {
  final RestClient _restClient;

  AuthRepository(this._restClient);

  @override
  Future<Token> register(RegisterRequest registerRequest) async {
    Token token = Token();
    try {
      token = await _restClient.register(registerRequest);
    } on CustomGenericDioError catch (e) {
      token.message = e.text;
      token.status = e.response!.statusCode;
    }
    return token;
  }

  @override
  Future<SuccessResponse> sendSms(SendSmsRequest sendSmsRequest) async {
    SuccessResponse successResponse = SuccessResponse();
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
  Future<ConfirmSms> confirmSms(ConfirmSmsRequest confirmSmsRequest) async {
    ConfirmSms confirmSms = ConfirmSms();
    try {
      confirmSms = await _restClient.sendConfirmSms(confirmSmsRequest);
      confirmSms.isSuccess = true;
    } on CustomGenericDioError catch (e) {
      confirmSms.message = e.text;
      confirmSms.status = e.response!.statusCode;
      confirmSms.isSuccess = false;
    }
    return confirmSms;
  }

  @override
  Future<Token?> token(TokenRequest tokenRequest) async {
    Token token = Token();
    try {
      token = await _restClient.token(tokenRequest);
    } on CustomGenericDioError catch (e) {
      token.message = e.text;
      token.status = e.response!.statusCode;
    }
    return token;
  }
}
