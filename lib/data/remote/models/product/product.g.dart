// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    name: json['name'] as String,
    imageUrl: json['imageURL'] as String,
    price: (json['price'] as num).toDouble(),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageURL': instance.imageUrl,
      'price': instance.price,
      'description': instance.description,
    };
