// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_job_posting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteJobPosting _$FavoriteJobPostingFromJson(Map<String, dynamic> json) =>
    FavoriteJobPosting(
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      workType: json['workType'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$FavoriteJobPostingToJson(FavoriteJobPosting instance) =>
    <String, dynamic>{
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'workType': instance.workType,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
    };
