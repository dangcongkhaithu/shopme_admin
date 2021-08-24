import 'package:json_annotation/json_annotation.dart';
import 'package:shopme_admin/data/remote/models/product/product.dart';


part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  final int quantity;
  final double price;
  final String createdDate;
  final Product product;

  OrderItem({
    required this.quantity,
    required this.price,
    required this.createdDate,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
