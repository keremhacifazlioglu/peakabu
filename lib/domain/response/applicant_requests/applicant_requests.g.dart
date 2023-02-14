// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantRequests _$ApplicantRequestsFromJson(Map<String, dynamic> json) =>
    ApplicantRequests(
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      workType: json['workType'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      follow: json['follow'] as bool?,
    );

Map<String, dynamic> _$ApplicantRequestsToJson(ApplicantRequests instance) =>
    <String, dynamic>{
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'workType': instance.workType,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'follow': instance.follow,
    };
