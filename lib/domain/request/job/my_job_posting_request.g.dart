// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_job_posting_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyJobPostingRequest _$MyJobPostingRequestFromJson(Map<String, dynamic> json) =>
    MyJobPostingRequest(
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      workType: json['workType'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      follow: json['follow'] as bool?,
    );

Map<String, dynamic> _$MyJobPostingRequestToJson(
        MyJobPostingRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'workType': instance.workType,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'follow': instance.follow,
    };
