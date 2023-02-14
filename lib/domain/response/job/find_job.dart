import 'package:json_annotation/json_annotation.dart';

part 'find_job.g.dart';

@JsonSerializable()
class FindJob {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  String? status;

  FindJob({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.status,
  });

  factory FindJob.fromJson(Map<String, dynamic> json) {
    return _$FindJobFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FindJobToJson(this);
}
