// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hire_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HireJob _$HireJobFromJson(Map<String, dynamic> json) => HireJob(
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      workType: json['workType'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$HireJobToJson(HireJob instance) => <String, dynamic>{
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'workType': instance.workType,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'status': instance.status,
    };
