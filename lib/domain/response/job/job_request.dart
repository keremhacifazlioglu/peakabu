import 'package:json_annotation/json_annotation.dart';

part 'job_request.g.dart';

@JsonSerializable()
class JobRequest {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  String? status;

  JobRequest({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.status,
  });

  factory JobRequest.fromJson(Map<String, dynamic> json) {
    return _$JobRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JobRequestToJson(this);
}
