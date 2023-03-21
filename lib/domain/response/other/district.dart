import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable()
class District {
  String? key;
  String? value;

  District({this.key, this.value});

  factory District.fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
