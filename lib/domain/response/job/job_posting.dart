import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'job_posting.g.dart';

@JsonSerializable()
class JobPosting extends ExceptionError {
  int? id;
  String? title;
  String? caretakerType;
  String? shiftSystem;
  String? city;
  String? district;
  String? createdAt;
  bool? follow;

  JobPosting({
    this.id,
    this.title,
    this.caretakerType,
    this.shiftSystem,
    this.city,
    this.district,
    this.createdAt,
    this.follow,
    String? message,
    int? status,
    bool? isSuccess,

  }) : super(message: message, status: status, isSuccess: isSuccess);

  Map<String, dynamic> toJson() => _$JobPostingToJson(this);

  factory JobPosting.fromJson(Map<String, dynamic> json) =>
      _$JobPostingFromJson(json);
}
