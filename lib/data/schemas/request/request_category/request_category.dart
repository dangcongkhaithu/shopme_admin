import 'package:json_annotation/json_annotation.dart';

part 'request_category.g.dart';

@JsonSerializable()
class RequestCategory {
  final int id;

  @JsonKey(name: "categoryName")
  final String name;
  final String description;
  final String imageUrl;
  final int parentId;

  RequestCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.parentId,
  });

  factory RequestCategory.fromJson(Map<String, dynamic> json) => _$RequestCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$RequestCategoryToJson(this);
}
