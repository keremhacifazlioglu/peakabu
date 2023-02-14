import 'package:json_annotation/json_annotation.dart';

part 'age.g.dart';

@JsonSerializable()
class Age {
  String? key;
  String? value;

  Age({this.key, this.value});

  factory Age.fromJson(Map<String, dynamic> json) => _$AgeFromJson(json);

  Map<String, dynamic> toJson() => _$AgeToJson(this);
}
