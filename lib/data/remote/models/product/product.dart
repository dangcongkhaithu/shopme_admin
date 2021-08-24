import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;

  @JsonKey(name: "imageURL")
  final String imageUrl;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description
});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
