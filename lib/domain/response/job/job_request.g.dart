// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobRequest _$JobRequestFromJson(Map<String, dynamic> json) => JobRequest(
      id: json['id'] as int?,
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystem: json['shiftSystem'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      requestStatus: json['requestStatus'] as String?,
      favorite: json['favorite'] as bool?,
    );

Map<String, dynamic> _$JobRequestToJson(JobRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'shiftSystem': instance.shiftSystem,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'requestStatus': instance.requestStatus,
      'favorite': instance.favorite,
    };
