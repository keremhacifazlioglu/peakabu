// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_sms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendSmsRequest _$SendSmsRequestFromJson(Map<String, dynamic> json) =>
    SendSmsRequest(
      phone: json['phone'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$SendSmsRequestToJson(SendSmsRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'uuid': instance.uuid,
    };
