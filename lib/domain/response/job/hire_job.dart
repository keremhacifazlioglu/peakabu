import 'package:json_annotation/json_annotation.dart';

part 'hire_job.g.dart';

@JsonSerializable()
class HireJob {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  String? status;

  HireJob({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.status,
  });

  factory HireJob.fromJson(Map<String, dynamic> json) {
    return _$HireJobFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HireJobToJson(this);
}
