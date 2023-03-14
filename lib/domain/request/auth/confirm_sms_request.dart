import 'package:json_annotation/json_annotation.dart';

part 'confirm_sms_request.g.dart';

@JsonSerializable()
class ConfirmSmsRequest {
  String? phone;
  String? code;
  String? uuid;
  String? smsId;

  ConfirmSmsRequest({this.phone, this.code,this.smsId,this.uuid});

  factory ConfirmSmsRequest.fromJson(Map<String, dynamic> json) {
    return _$ConfirmSmsRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConfirmSmsRequestToJson(this);
}
