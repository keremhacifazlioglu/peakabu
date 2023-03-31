import 'package:json_annotation/json_annotation.dart';
import 'package:peakabu/domain/exception_error.dart';

part 'recruiter_job_detail.g.dart';

@JsonSerializable()
class RecruiterJobDetail extends ExceptionError {
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

  RecruiterJobDetail({
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
  }) : super(message: message, status: status);

  factory RecruiterJobDetail.fromJson(Map<String, dynamic> json) {
    return _$RecruiterJobDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecruiterJobDetailToJson(this);
}
