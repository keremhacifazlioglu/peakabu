import 'package:json_annotation/json_annotation.dart';

part 'caretaker_type.g.dart';

@JsonSerializable()
class CaretakerType {
  String? key;
  String? value;

  CaretakerType({this.key, this.value});

  factory CaretakerType.fromJson(Map<String, dynamic> json) {
    return _$CaretakerTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CaretakerTypeToJson(this);
}
