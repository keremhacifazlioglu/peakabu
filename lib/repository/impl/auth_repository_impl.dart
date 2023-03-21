import 'package:platform/domain/request/auth/confirm_sms_request.dart';
import 'package:platform/domain/request/auth/register_request.dart';
import 'package:platform/domain/request/auth/send_sms_request.dart';
import 'package:platform/domain/request/auth/token_request.dart';
import 'package:platform/domain/response/auth/send_sms.dart';
import 'package:platform/domain/response/auth/token.dart';
import 'package:platform/domain/response/success_response.dart';

abstract class IAuthRepository {
  Future<Token?> token(TokenRequest tokenRequest);

  Future<SendSms> sendSms(SendSmsRequest sendSmsRequest);

  Future<SuccessResponse> confirmSms(ConfirmSmsRequest confirmSmsRequest);

  Future<SuccessResponse> register(RegisterRequest registerRequest);
}
