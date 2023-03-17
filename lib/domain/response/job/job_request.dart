import 'package:json_annotation/json_annotation.dart';

part 'job_request.g.dart';

@JsonSerializable()
class JobRequest {
  String? title;
  String? caretakerType;
  String? shiftSystem;
  String? city;
  String? district;
  String? createdAt;
  String? requestStatus;
  bool? favorite;

  JobRequest({
    this.title,
    this.caretakerType,
    this.shiftSystem,
    this.city,
    this.district,
    this.createdAt,
    this.requestStatus,
    this.favorite,
  });

  factory JobRequest.fromJson(Map<String, dynamic> json) {
    return _$JobRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JobRequestToJson(this);
}
