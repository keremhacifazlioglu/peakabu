import 'package:json_annotation/json_annotation.dart';

part 'find_applicant.g.dart';

@JsonSerializable()
class FindApplicant {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;
  String? status;

  FindApplicant({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
    this.status,
  });

  factory FindApplicant.fromJson(Map<String, dynamic> json) {
    return _$FindApplicantFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FindApplicantToJson(this);
}
