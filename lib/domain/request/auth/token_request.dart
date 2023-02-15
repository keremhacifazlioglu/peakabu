import 'package:json_annotation/json_annotation.dart';

part 'token_request.g.dart';

@JsonSerializable()
class TokenRequest {
  String? phoneNumber;
  String? uuid;

  TokenRequest({this.phoneNumber, this.uuid});

  factory TokenRequest.fromJson(Map<String, dynamic> json) {
    return _$TokenRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TokenRequestToJson(this);
}
