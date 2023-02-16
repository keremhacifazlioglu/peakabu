// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) =>
    SuccessResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    )..status = json['status'] as int?;

Map<String, dynamic> _$SuccessResponseToJson(SuccessResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'success': instance.success,
    };
