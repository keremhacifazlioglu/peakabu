import 'package:injectable/injectable.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/domain/response/auth/confirm_sms.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/request/auth/register_request.dart';
import 'package:platform/domain/request/auth/confirm_sms_request.dart';
import 'package:platform/network/interceptor/error_interceptor.dart';
import 'package:platform/network/rest_client.dart';
import 'package:platform/repository/impl/auth_repository_impl.dart';
import 'package:platform/util/logger.dart';

@injectable
class AuthRepository implements IAuthRepository {
  final RestClient _restClient;

  AuthRepository(this._restClient);

  @override
  Future<ConfirmSms> confirmSms(ConfirmSmsRequest confirmSmsRequest) async {
    return await _restClient.sendConfirmSms(confirmSmsRequest);
  }

  @override
  Future<Token> register(RegisterRequest registerRequest) async {
    return await _restClient.register(registerRequest);
  }

  @override
  Future<bool> sendSms(SendSmsRequest sendSmsRequest) async {
    return await _restClient.sendSms(sendSmsRequest);
  }

  @override
  Future<Token?> token(TokenRequest tokenRequest) async {
    Token token = Token();
    try {
      token = await _restClient.token(tokenRequest);
    } on BaseError catch (e) {
      token.message = e.text;
      token.status = e.response!.statusCode;
    }
    return token;
  }
}
