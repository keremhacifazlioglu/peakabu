// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_sms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendSmsRequest _$SendSmsRequestFromJson(Map<String, dynamic> json) =>
    SendSmsRequest(
      phoneNumber: json['phoneNumber'] as String?,
      isKvkk: json['isKvkk'] as bool?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$SendSmsRequestToJson(SendSmsRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'uuid': instance.uuid,
      'isKvkk': instance.isKvkk,
    };
