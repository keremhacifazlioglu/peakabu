import 'package:json_annotation/json_annotation.dart';

part 'applicant_requests.g.dart';

@JsonSerializable()
class ApplicantRequests {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  bool? follow;

  ApplicantRequests({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.follow,
  });

  factory ApplicantRequests.fromJson(Map<String, dynamic> json) {
    return _$ApplicantRequestsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApplicantRequestsToJson(this);
}
