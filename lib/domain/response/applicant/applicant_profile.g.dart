// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantProfile _$ApplicantProfileFromJson(Map<String, dynamic> json) =>
    ApplicantProfile(
      image: json['image'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystems: json['shiftSystems'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
    );

Map<String, dynamic> _$ApplicantProfileToJson(ApplicantProfile instance) =>
    <String, dynamic>{
      'image': instance.image,
      'caretakerType': instance.caretakerType,
      'shiftSystems': instance.shiftSystems,
      'city': instance.city,
      'district': instance.district,
    };
