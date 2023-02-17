// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_sms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmSms _$ConfirmSmsFromJson(Map<String, dynamic> json) => ConfirmSms(
      phone: json['phone'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$ConfirmSmsToJson(ConfirmSms instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'phone': instance.phone,
      'code': instance.code,
    };
