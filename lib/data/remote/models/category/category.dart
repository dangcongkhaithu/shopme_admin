import 'package:json_annotation/json_annotation.dart';
import 'package:shopme_admin/data/remote/models/product/product.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final int id;
  final String categoryName;
  final String description;
  final String imageUrl;
  List<Product> products;

  Category({
    required this.id,
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    required this.products
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
