// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetail _$JobDetailFromJson(Map<String, dynamic> json) => JobDetail(
      id: json['id'] as int?,
      title: json['title'] as String?,
      gender: json['gender'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystem: json['shiftSystem'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      follow: json['follow'] as bool?,
      desc: json['desc'] as String?,
      experience: json['experience'] as String?,
      nationality: json['nationality'] as String?,
      age: json['age'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$JobDetailToJson(JobDetail instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'id': instance.id,
      'title': instance.title,
      'gender': instance.gender,
      'caretakerType': instance.caretakerType,
      'shiftSystem': instance.shiftSystem,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'follow': instance.follow,
      'desc': instance.desc,
      'experience': instance.experience,
      'nationality': instance.nationality,
      'age': instance.age,
    };
