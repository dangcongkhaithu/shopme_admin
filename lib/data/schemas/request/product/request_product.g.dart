// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestProduct _$RequestProductFromJson(Map<String, dynamic> json) {
  return RequestProduct(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    price: (json['price'] as num).toDouble(),
    categoryId: json['categoryId'] as int,
  );
}

Map<String, dynamic> _$RequestProductToJson(RequestProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'categoryId': instance.categoryId,
    };
