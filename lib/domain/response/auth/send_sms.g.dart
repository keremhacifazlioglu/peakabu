// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_sms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendSms _$SendSmsFromJson(Map<String, dynamic> json) => SendSms(
      smsId: json['smsId'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$SendSmsToJson(SendSms instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'smsId': instance.smsId,
    };
