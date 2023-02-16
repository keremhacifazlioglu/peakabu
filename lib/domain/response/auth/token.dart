import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'token.g.dart';

@JsonSerializable()
class Token extends ExceptionError {
  String? token;
  bool? isUserRegistered;

  Token({this.token, this.isUserRegistered, String? message, int? status})
      : super(message: message, status: status);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
