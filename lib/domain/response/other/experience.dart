import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

@JsonSerializable()
class Experience {
  String? key;
  String? value;

  Experience({this.key, this.value});

  factory Experience.fromJson(Map<String, dynamic> json) {
    return _$ExperienceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
