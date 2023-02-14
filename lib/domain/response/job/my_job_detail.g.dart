// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_job_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyJobDetail _$MyJobDetailFromJson(Map<String, dynamic> json) => MyJobDetail(
      id: json['id'] as int?,
      title: json['title'] as String?,
      gender: json['gender'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      caretakerType: json['caretakerType'] as String?,
      shiftSystems: json['shiftSystems'] as String?,
      experience: json['experience'] as String?,
      nationality: json['nationality'] as String?,
      age: json['age'] as String?,
      listingDate: json['listingDate'] as String?,
      desc: json['desc'] as String?,
    );

Map<String, dynamic> _$MyJobDetailToJson(MyJobDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'gender': instance.gender,
      'city': instance.city,
      'district': instance.district,
      'caretakerType': instance.caretakerType,
      'shiftSystems': instance.shiftSystems,
      'experience': instance.experience,
      'nationality': instance.nationality,
      'age': instance.age,
      'listingDate': instance.listingDate,
      'desc': instance.desc,
    };
