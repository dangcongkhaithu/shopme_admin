// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as int,
    categoryName: json['categoryName'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    products: (json['products'] as List<dynamic>)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'products': instance.products,
    };
