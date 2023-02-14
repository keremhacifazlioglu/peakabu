// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_applicant_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteApplicantProfile _$FavoriteApplicantProfileFromJson(
        Map<String, dynamic> json) =>
    FavoriteApplicantProfile(
      image: json['image'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystems: json['shiftSystems'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
    );

Map<String, dynamic> _$FavoriteApplicantProfileToJson(
        FavoriteApplicantProfile instance) =>
    <String, dynamic>{
      'image': instance.image,
      'caretakerType': instance.caretakerType,
      'shiftSystems': instance.shiftSystems,
      'city': instance.city,
      'district': instance.district,
    };
