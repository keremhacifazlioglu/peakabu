import 'package:json_annotation/json_annotation.dart';

part 'confirm_sms.g.dart';

@JsonSerializable()
class ConfirmSms {
  String? phone;
  String? code;

  ConfirmSms({this.phone, this.code});

  factory ConfirmSms.fromJson(Map<String, dynamic> json) {
    return _$ConfirmSmsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConfirmSmsToJson(this);
}
