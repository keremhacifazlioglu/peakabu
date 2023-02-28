import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'job_detail.g.dart';

@JsonSerializable()
class JobDetail extends ExceptionError {
  int? id;
  String? title;
  String? gender;
  String? caretakerType;
  String? shiftSystem;
  String? city;
  String? district;
  String? createdAt;
  bool? follow;
  String? desc;
  String? experience;
  String? nationality;
  String? age;

  JobDetail({
    this.id,
    this.title,
    this.gender,
    this.caretakerType,
    this.shiftSystem,
    this.city,
    this.district,
    this.createdAt,
    this.follow,
    this.desc,
    this.experience,
    this.nationality,
    this.age,
    String? message,
    int? status,
    bool? isSuccess,
  }) : super(message: message, status: status, isSuccess: isSuccess);

  factory JobDetail.fromJson(Map<String, dynamic> json) {
    return _$JobDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JobDetailToJson(this);
}
