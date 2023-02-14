import 'package:json_annotation/json_annotation.dart';

part 'nationality.g.dart';

@JsonSerializable()
class Nationality {
  String? key;
  String? value;

  Nationality({this.key, this.value});

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return _$NationalityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NationalityToJson(this);
}
