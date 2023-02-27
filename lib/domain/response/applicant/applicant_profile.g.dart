// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantProfile _$ApplicantProfileFromJson(Map<String, dynamic> json) =>
    ApplicantProfile(
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
      favorite: json['favorite'] as bool?,
      nationality: json['nationality'] as String?,
      experience: json['experience'] as String?,
      age: json['age'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$ApplicantProfileToJson(ApplicantProfile instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
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
      'nationality': instance.nationality,
      'experience': instance.experience,
      'age': instance.age,
      'favorite': instance.favorite,
    };
