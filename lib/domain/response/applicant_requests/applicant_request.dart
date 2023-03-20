import 'package:json_annotation/json_annotation.dart';

part 'applicant_request.g.dart';

@JsonSerializable()
class ApplicantRequest {
  int? id;
  String? title;
  String? caretakerType;
  String? shiftSystem;
  String? city;
  String? district;
  String? createdAt;
  String? requestStatus;

  ApplicantRequest({
    this.id,
    this.title,
    this.caretakerType,
    this.shiftSystem,
    this.city,
    this.district,
    this.createdAt,
    this.requestStatus,
  });

  factory ApplicantRequest.fromJson(Map<String, dynamic> json) {
    return _$ApplicantRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApplicantRequestToJson(this);
}
