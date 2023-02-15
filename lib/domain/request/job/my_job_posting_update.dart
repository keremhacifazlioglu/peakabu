import 'package:json_annotation/json_annotation.dart';

part 'my_job_posting_update.g.dart';

@JsonSerializable()
class MyJobPostingUpdate {
  String? title;
  String? gender;
  String? city;
  String? district;
  String? caretakerType;
  String? shiftSystems;
  String? experience;
  String? nationality;
  String? age;
  String? listingDate;
  String? desc;

  MyJobPostingUpdate({
    this.title,
    this.gender,
    this.city,
    this.district,
    this.caretakerType,
    this.shiftSystems,
    this.experience,
    this.nationality,
    this.age,
    this.listingDate,
    this.desc,
  });

  factory MyJobPostingUpdate.fromJson(Map<String, dynamic> json) {
    return _$MyJobPostingUpdateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MyJobPostingUpdateToJson(this);
}
