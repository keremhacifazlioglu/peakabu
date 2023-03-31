import 'package:json_annotation/json_annotation.dart';
import 'package:peakabu/domain/exception_error.dart';

part 'job_posting.g.dart';

@JsonSerializable()
class JobPosting extends ExceptionError {
  int? id;
  String? title;
  String? caretakerType;
  String? shiftSystem;
  String? city;
  String? district;
  String? createdAt;
  bool? favorite;
  String? desc;


  JobPosting({
    this.id,
    this.title,
    this.caretakerType,
    this.shiftSystem,
    this.city,
    this.district,
    this.createdAt,
    this.favorite,
    this.desc,
    String? message,
    int? status,
    bool? isSuccess,

  }) : super(message: message, status: status, isSuccess: isSuccess);

  Map<String, dynamic> toJson() => _$JobPostingToJson(this);

  factory JobPosting.fromJson(Map<String, dynamic> json) =>
      _$JobPostingFromJson(json);
}
