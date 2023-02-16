import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'success_response.g.dart';

@JsonSerializable()
class SuccessResponse extends ExceptionError {
  bool? success;

  SuccessResponse({
    this.success,
    String? message,
    int? statusCode,
  }) : super(message: message, status: statusCode);

  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$SuccessResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuccessResponseToJson(this);
}
