import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'hire_job.g.dart';

@JsonSerializable()
class HireJob extends ExceptionError {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  String? status1;

  HireJob({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.status1,
    String? message,
    int? status,
  }) : super(message: message, status: status);

  factory HireJob.fromJson(Map<String, dynamic> json) {
    return _$HireJobFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HireJobToJson(this);
}
