// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_posting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPosting _$JobPostingFromJson(Map<String, dynamic> json) => JobPosting(
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      workType: json['workType'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$JobPostingToJson(JobPosting instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'workType': instance.workType,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
    };
