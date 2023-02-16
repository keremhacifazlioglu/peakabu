import 'package:platform/domain/request/auth/confirm_sms_request.dart';
import 'package:platform/domain/request/auth/register_request.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/response/auth/confirm_sms.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/domain/response/success_response.dart';

abstract class IAuthRepository {
  Future<Token?> token(TokenRequest tokenRequest);

  Future<SuccessResponse> sendSms(SendSmsRequest sendSmsRequest);

  Future<ConfirmSms> confirmSms(ConfirmSmsRequest confirmSmsRequest);

  Future<Token> register(RegisterRequest registerRequest);
}
