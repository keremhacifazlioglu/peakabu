import 'package:json_annotation/json_annotation.dart';

part 'my_job_detail.g.dart';

@JsonSerializable()
class MyJobDetail {
  int? id;
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

  MyJobDetail({
    this.id,
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

  factory MyJobDetail.fromJson(Map<String, dynamic> json) {
    return _$MyJobDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MyJobDetailToJson(this);
}
