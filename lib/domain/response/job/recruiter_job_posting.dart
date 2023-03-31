import 'package:json_annotation/json_annotation.dart';
import 'package:peakabu/domain/exception_error.dart';

part 'recruiter_job_posting.g.dart';

@JsonSerializable()
class RecruiterJobPosting extends ExceptionError {
  int? id;
  String? title;
  String? gender;
  String? city;
  String? district;
  String? caretakerType;
  String? shiftSystems;
  String? experience;
  String? nationality;
  String? age;
  String? listingDate;
  String? desc;

  RecruiterJobPosting({
    this.id,
    this.title,
    this.gender,
    this.city,
    this.district,
    this.caretakerType,
    this.shiftSystems,
    this.experience,
    this.nationality,
    this.age,
    this.listingDate,
    this.desc,
    String? message,
    int? status,
    bool? isSuccess,
  }) : super(message: message, status: status, isSuccess: isSuccess );

  factory RecruiterJobPosting.fromJson(Map<String, dynamic> json) {
    return _$RecruiterJobPostingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecruiterJobPostingToJson(this);
}
