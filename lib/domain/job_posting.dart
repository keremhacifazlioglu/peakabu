import 'package:json_annotation/json_annotation.dart';

part 'job_posting.g.dart';

@JsonSerializable()
class JobPosting {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;

  JobPosting({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => _$JobPostingToJson(this);

  factory JobPosting.fromJson(Map<String, dynamic> json) => _$JobPostingFromJson(json);
}
