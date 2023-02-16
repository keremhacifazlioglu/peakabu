// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruiter_job_posting_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecruiterJobPostingRequest _$RecruiterJobPostingRequestFromJson(
        Map<String, dynamic> json) =>
    RecruiterJobPostingRequest(
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      workType: json['workType'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      follow: json['follow'] as bool?,
    );

Map<String, dynamic> _$RecruiterJobPostingRequestToJson(
        RecruiterJobPostingRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'workType': instance.workType,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'follow': instance.follow,
    };
