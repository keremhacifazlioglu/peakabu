import 'package:json_annotation/json_annotation.dart';

part 'applicant_request.g.dart';

@JsonSerializable()
class ApplicantRequest {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  String? status;

  ApplicantRequest({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.status,
  });

  factory ApplicantRequest.fromJson(Map<String, dynamic> json) {
    return _$ApplicantRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApplicantRequestToJson(this);
}
