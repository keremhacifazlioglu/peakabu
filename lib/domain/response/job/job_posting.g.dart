// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_posting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPosting _$JobPostingFromJson(Map<String, dynamic> json) => JobPosting(
      id: json['id'] as int?,
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystem: json['shiftSystem'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      favorite: json['favorite'] as bool?,
      desc: json['desc'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$JobPostingToJson(JobPosting instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'id': instance.id,
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'shiftSystem': instance.shiftSystem,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'favorite': instance.favorite,
      'desc': instance.desc,
    };
