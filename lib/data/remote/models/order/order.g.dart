// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    id: json['id'] as int,
    shippingInfo:
        ShippingInfo.fromJson(json['shippingInfo'] as Map<String, dynamic>),
    orderItems: (json['orderItems'] as List<dynamic>)
        .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String,
    totalPrice: (json['totalPrice'] as num).toDouble(),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'shippingInfo': instance.shippingInfo,
      'orderItems': instance.orderItems,
      'status': instance.status,
      'totalPrice': instance.totalPrice,
    };
