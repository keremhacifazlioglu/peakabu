import 'package:json_annotation/json_annotation.dart';

part 'favorite_applicant_profile.g.dart';

@JsonSerializable()
class FavoriteApplicantProfile {
  String? image;
  String? caretakerType;
  String? shiftSystems;
  String? city;
  String? district;

  FavoriteApplicantProfile({
    this.image,
    this.caretakerType,
    this.shiftSystems,
    this.city,
    this.district,
  });

  factory FavoriteApplicantProfile.fromJson(Map<String, dynamic> json) {
    return _$FavoriteApplicantProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteApplicantProfileToJson(this);
}
