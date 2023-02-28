import 'package:json_annotation/json_annotation.dart';

part 'recruiter_job_posting_update.g.dart';

@JsonSerializable()
class RecruiterJobPostingUpdate {
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

  RecruiterJobPostingUpdate({
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
  });

  factory RecruiterJobPostingUpdate.fromJson(Map<String, dynamic> json) {
    return _$RecruiterJobPostingUpdateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecruiterJobPostingUpdateToJson(this);
}
