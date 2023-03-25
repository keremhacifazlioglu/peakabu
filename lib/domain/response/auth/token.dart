import 'package:json_annotation/json_annotation.dart';
import 'package:platform/domain/exception_error.dart';

part 'token.g.dart';

@JsonSerializable()
class Token extends ExceptionError {
  String? token;
  bool? isUserRegistered;
  String? userType;

  Token({this.token, this.isUserRegistered,this.userType, String? message, int? status, bool? isSuccess})
      : super(message: message, status: status, isSuccess: isSuccess);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
