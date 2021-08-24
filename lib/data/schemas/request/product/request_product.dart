
import 'package:json_annotation/json_annotation.dart';

part 'request_product.g.dart';

@JsonSerializable()
class RequestProduct {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final int categoryId;

  RequestProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.categoryId,
  });

  factory RequestProduct.fromJson(Map<String, dynamic> json) => _$RequestProductFromJson(json);

  Map<String, dynamic> toJson() => _$RequestProductToJson(this);
}
