// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_sms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmSms _$ConfirmSmsFromJson(Map<String, dynamic> json) => ConfirmSms(
      phone: json['phone'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ConfirmSmsToJson(ConfirmSms instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };
