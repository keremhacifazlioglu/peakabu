// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobRequest _$JobRequestFromJson(Map<String, dynamic> json) => JobRequest(
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystem: json['shiftSystem'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$JobRequestToJson(JobRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'shiftSystem': instance.shiftSystem,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'status': instance.status,
    };
