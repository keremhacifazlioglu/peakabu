import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'job_phone.g.dart';

@JsonSerializable()
class JobPhone extends ExceptionError {
  String? phoneNumber;

  JobPhone({
    this.phoneNumber,
    String? message,
    int? status,
  }) : super(message: message, status: status);

  factory JobPhone.fromJson(Map<String, dynamic> json) {
    return _$JobPhoneFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JobPhoneToJson(this);
}
