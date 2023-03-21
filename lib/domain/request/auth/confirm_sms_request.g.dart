// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_sms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmSmsRequest _$ConfirmSmsRequestFromJson(Map<String, dynamic> json) =>
    ConfirmSmsRequest(
      phone: json['phone'] as String?,
      code: json['code'] as String?,
      smsId: json['smsId'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$ConfirmSmsRequestToJson(ConfirmSmsRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
      'uuid': instance.uuid,
      'smsId': instance.smsId,
    };
