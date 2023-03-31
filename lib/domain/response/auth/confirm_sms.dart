import 'package:json_annotation/json_annotation.dart';
import 'package:peakabu/domain/exception_error.dart';

part 'confirm_sms.g.dart';

@JsonSerializable()
class ConfirmSms extends ExceptionError {
  String? phone;
  String? code;

  ConfirmSms(
      {this.phone, this.code, String? message, int? status, bool? isSuccess})
      : super(message: message, status: status, isSuccess: isSuccess);

  factory ConfirmSms.fromJson(Map<String, dynamic> json) {
    return _$ConfirmSmsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConfirmSmsToJson(this);
}
