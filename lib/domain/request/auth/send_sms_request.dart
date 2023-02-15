import 'package:json_annotation/json_annotation.dart';

part 'send_sms_request.g.dart';

@JsonSerializable()
class SendSmsRequest {
  String? phoneNumber;

  SendSmsRequest({this.phoneNumber});

  factory SendSmsRequest.fromJson(Map<String, dynamic> json) {
    return _$SendSmsRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendSmsRequestToJson(this);
}
