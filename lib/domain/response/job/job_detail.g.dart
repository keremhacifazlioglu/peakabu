// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetail _$JobDetailFromJson(Map<String, dynamic> json) => JobDetail(
      id: json['id'] as int?,
      title: json['title'] as String?,
      gender: json['gender'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystems: json['shiftSystems'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      follow: json['follow'] as bool?,
      desc: json['desc'] as String?,
      experience: json['experience'] as String?,
      nationality: json['nationality'] as String?,
      age: json['age'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$JobDetailToJson(JobDetail instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'gender': instance.gender,
      'caretakerType': instance.caretakerType,
      'shiftSystems': instance.shiftSystems,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'follow': instance.follow,
      'desc': instance.desc,
      'experience': instance.experience,
      'nationality': instance.nationality,
      'age': instance.age,
      'status': instance.status,
    };
