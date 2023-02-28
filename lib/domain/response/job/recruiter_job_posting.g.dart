// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruiter_job_posting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecruiterJobPosting _$RecruiterJobPostingFromJson(Map<String, dynamic> json) =>
    RecruiterJobPosting(
      id: json['id'] as int?,
      title: json['title'] as String?,
      gender: json['gender'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystems: json['shiftSystems'] as String?,
      experience: json['experience'] as String?,
      nationality: json['nationality'] as String?,
      age: json['age'] as String?,
      listingDate: json['listingDate'] as String?,
      desc: json['desc'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$RecruiterJobPostingToJson(
        RecruiterJobPosting instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'id': instance.id,
      'title': instance.title,
      'gender': instance.gender,
      'city': instance.city,
      'district': instance.district,
      'caretakerType': instance.caretakerType,
      'shiftSystems': instance.shiftSystems,
      'experience': instance.experience,
      'nationality': instance.nationality,
      'age': instance.age,
      'listingDate': instance.listingDate,
      'desc': instance.desc,
    };
