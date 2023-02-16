// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPhone _$JobPhoneFromJson(Map<String, dynamic> json) => JobPhone(
      phoneNumber: json['phoneNumber'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$JobPhoneToJson(JobPhone instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'phoneNumber': instance.phoneNumber,
    };
