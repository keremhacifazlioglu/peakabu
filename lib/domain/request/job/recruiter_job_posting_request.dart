import 'package:json_annotation/json_annotation.dart';

part 'recruiter_job_posting_request.g.dart';

@JsonSerializable()
class RecruiterJobPostingRequest {
  String? title;
  String? gender;
  String? city;
  String? district;
  String? caretakerType;
  String? shiftSystem;
  String? experience;
  String? nationality;
  String? age;
  String? listingDate;
  String? desc;

  RecruiterJobPostingRequest({
    this.title,
    this.gender,
    this.city,
    this.district,
    this.caretakerType,
    this.shiftSystem,
    this.experience,
    this.nationality,
    this.age,
    this.listingDate,
    this.desc,
  });

  factory RecruiterJobPostingRequest.fromJson(Map<String, dynamic> json) {
    return _$RecruiterJobPostingRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecruiterJobPostingRequestToJson(this);
}
