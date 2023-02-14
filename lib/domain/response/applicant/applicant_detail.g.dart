// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantDetail _$ApplicantDetailFromJson(Map<String, dynamic> json) =>
    ApplicantDetail(
      id: json['id'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystems: json['shiftSystems'] as String?,
      lastSignedAt: json['lastSignedAt'] as String?,
      descTitle: json['descTitle'] as String?,
      desc: json['desc'] as String?,
      gender: json['gender'] as String?,
      smoking: json['smoking'] as bool?,
      travelRestriction: json['travelRestriction'] as bool?,
      favorite: json['favorite'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ApplicantDetailToJson(ApplicantDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'city': instance.city,
      'district': instance.district,
      'caretakerType': instance.caretakerType,
      'shiftSystems': instance.shiftSystems,
      'lastSignedAt': instance.lastSignedAt,
      'descTitle': instance.descTitle,
      'desc': instance.desc,
      'gender': instance.gender,
      'smoking': instance.smoking,
      'travelRestriction': instance.travelRestriction,
      'favorite': instance.favorite,
      'status': instance.status,
    };
