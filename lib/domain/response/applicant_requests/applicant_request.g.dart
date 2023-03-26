// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantRequest _$ApplicantRequestFromJson(Map<String, dynamic> json) =>
    ApplicantRequest(
      id: json['id'] as int?,
      title: json['title'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystem: json['shiftSystem'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createdAt: json['createdAt'] as String?,
      requestStatus: json['requestStatus'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ApplicantRequestToJson(ApplicantRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'caretakerType': instance.caretakerType,
      'shiftSystem': instance.shiftSystem,
      'city': instance.city,
      'district': instance.district,
      'createdAt': instance.createdAt,
      'requestStatus': instance.requestStatus,
      'image': instance.image,
    };
