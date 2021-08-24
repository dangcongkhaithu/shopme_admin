// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    quantity: json['quantity'] as int,
    price: (json['price'] as num).toDouble(),
    createdDate: json['createdDate'] as String,
    product: Product.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'quantity': instance.quantity,
      'price': instance.price,
      'createdDate': instance.createdDate,
      'product': instance.product,
    };
