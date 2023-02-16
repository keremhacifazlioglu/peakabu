import 'package:json_annotation/json_annotation.dart';

part 'recruiter_job_posting_request.g.dart';

@JsonSerializable()
class RecruiterJobPostingRequest {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  bool? follow;

  RecruiterJobPostingRequest({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.follow,
  });

  factory RecruiterJobPostingRequest.fromJson(Map<String, dynamic> json) {
    return _$RecruiterJobPostingRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecruiterJobPostingRequestToJson(this);
}
