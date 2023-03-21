import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'success_response.g.dart';

@JsonSerializable()
class SuccessResponse extends ExceptionError {
  bool? success;
  bool? follow;
  int? id;

  SuccessResponse({
    this.success,
    this.follow,
    this.id,
    String? message,
    int? statusCode,
    bool? isSuccess,
  }) : super(
          message: message,
          status: statusCode,
          isSuccess: isSuccess,
        );

  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$SuccessResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuccessResponseToJson(this);
}
