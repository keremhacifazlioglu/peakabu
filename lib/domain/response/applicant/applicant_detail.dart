import 'package:json_annotation/json_annotation.dart';

part 'applicant_detail.g.dart';

@JsonSerializable()
class ApplicantDetail {
  int? id;
  String? image;
  String? name;
  String? city;
  String? district;
  String? caretakerType;
  String? shiftSystems;
  String? lastSignedAt;
  String? descTitle;
  String? desc;
  String? gender;
  bool? smoking;
  bool? travelRestriction;
  bool? favorite;
  String? status;

  ApplicantDetail({
    this.id,
    this.image,
    this.name,
    this.city,
    this.district,
    this.caretakerType,
    this.shiftSystems,
    this.lastSignedAt,
    this.descTitle,
    this.desc,
    this.gender,
    this.smoking,
    this.travelRestriction,
    this.favorite,
    this.status,
  });

  factory ApplicantDetail.fromJson(Map<String, dynamic> json) {
    return _$ApplicantDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApplicantDetailToJson(this);
}
