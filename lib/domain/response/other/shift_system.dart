import 'package:json_annotation/json_annotation.dart';

part 'shift_system.g.dart';

@JsonSerializable()
class ShiftSystem {
  String? key;
  String? value;

  ShiftSystem({this.key, this.value});

  factory ShiftSystem.fromJson(Map<String, dynamic> json) {
    return _$ShiftSystemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ShiftSystemToJson(this);
}
