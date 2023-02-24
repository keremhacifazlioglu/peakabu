import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'job_posting.g.dart';

@JsonSerializable()
class JobPosting extends ExceptionError {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  bool? follow;

  JobPosting({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.follow,
    String? message,
    int? status,

  }) : super(message: message, status: status);

  Map<String, dynamic> toJson() => _$JobPostingToJson(this);

  factory JobPosting.fromJson(Map<String, dynamic> json) =>
      _$JobPostingFromJson(json);
}
