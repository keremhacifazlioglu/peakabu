// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPhone _$JobPhoneFromJson(Map<String, dynamic> json) => JobPhone(
      phone: json['phone'] as String?,
      message: json['message'] as String?,
      isSuccess: json['isSuccess'] as bool?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$JobPhoneToJson(JobPhone instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'phone': instance.phone,
    };
