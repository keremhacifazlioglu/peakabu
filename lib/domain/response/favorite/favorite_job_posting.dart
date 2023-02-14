import 'package:json_annotation/json_annotation.dart';

part 'favorite_job_posting.g.dart';

@JsonSerializable()
class FavoriteJobPosting {
  String? title;
  String? caretakerType;
  String? workType;
  String? city;
  String? district;
  String? createdAt;

  FavoriteJobPosting({
    this.title,
    this.caretakerType,
    this.workType,
    this.city,
    this.district,
    this.createdAt,
  });

  factory FavoriteJobPosting.fromJson(Map<String, dynamic> json) {
    return _$FavoriteJobPostingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteJobPostingToJson(this);
}
