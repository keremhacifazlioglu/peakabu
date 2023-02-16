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
      status1: json['status1'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
    )..isSuccess = json['isSuccess'] as bool?;

Map<String, dynamic> _$HireJobToJson(HireJob instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'workType': instance.workType,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'status1': instance.status1,
    };
