import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'applicant_profile.g.dart';

@JsonSerializable()
class ApplicantProfile extends ExceptionError {
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
  String? nationality;
  String? experience;
  String? age;
  bool? smoking;
  bool? travelRestriction;

  ApplicantProfile({
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
    this.nationality,
    this.experience,
    this.age,
    String? message,
    int? status,
    bool? isSuccess,
  }) : super(message: message, status: status, isSuccess: isSuccess);

  factory ApplicantProfile.fromJson(Map<String, dynamic> json) {
    return _$ApplicantProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApplicantProfileToJson(this);
}
