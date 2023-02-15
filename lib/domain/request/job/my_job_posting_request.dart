import 'package:json_annotation/json_annotation.dart';

part 'my_job_posting_request.g.dart';

@JsonSerializable()
class MyJobPostingRequest {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  bool? follow;

  MyJobPostingRequest({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.follow,
  });

  factory MyJobPostingRequest.fromJson(Map<String, dynamic> json) {
    return _$MyJobPostingRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MyJobPostingRequestToJson(this);
}
