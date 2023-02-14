import 'package:json_annotation/json_annotation.dart';

part 'job_phone.g.dart';

@JsonSerializable()
class JobPhone {
  String? phoneNumber;

  JobPhone({this.phoneNumber});

  factory JobPhone.fromJson(Map<String, dynamic> json) {
    return _$JobPhoneFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JobPhoneToJson(this);
}
