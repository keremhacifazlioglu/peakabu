// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      uuid: json['uuid'] as String?,
      phone: json['phone'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'phone': instance.phone,
      'userType': instance.userType,
    };
