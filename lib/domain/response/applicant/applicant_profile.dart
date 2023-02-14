import 'package:json_annotation/json_annotation.dart';

part 'applicant_profile.g.dart';

@JsonSerializable()
class ApplicantProfile {
  String? image;
  String? caretakerType;
  String? shiftSystems;
  String? city;
  String? district;

  ApplicantProfile({
    this.image,
    this.caretakerType,
    this.shiftSystems,
    this.city,
    this.district,
  });

  factory ApplicantProfile.fromJson(Map<String, dynamic> json) {
    return _$ApplicantProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApplicantProfileToJson(this);
}
