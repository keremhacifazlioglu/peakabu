import 'package:json_annotation/json_annotation.dart';
import 'package:peakabu/domain/exception_error.dart';

part 'send_sms.g.dart';

@JsonSerializable()
class SendSms extends ExceptionError {
  String? smsId;

  SendSms(
      {this.smsId, String? message, int? status, bool? isSuccess})
      : super(message: message, status: status, isSuccess: isSuccess);

  factory SendSms.fromJson(Map<String, dynamic> json) {
    return _$SendSmsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendSmsToJson(this);
}
