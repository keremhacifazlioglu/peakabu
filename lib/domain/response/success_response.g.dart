// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) =>
    SuccessResponse(
      success: json['success'] as bool?,
      follow: json['follow'] as bool?,
      id: json['id'] as int?,
      message: json['message'] as String?,
      isSuccess: json['isSuccess'] as bool?,
    )..status = json['status'] as int?;

Map<String, dynamic> _$SuccessResponseToJson(SuccessResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.isSuccess,
      'success': instance.success,
      'follow': instance.follow,
      'id': instance.id,
    };
