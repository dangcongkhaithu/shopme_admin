// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCategory _$RequestCategoryFromJson(Map<String, dynamic> json) {
  return RequestCategory(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    parentId: json['parentId'] as int,
  );
}

Map<String, dynamic> _$RequestCategoryToJson(RequestCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'parentId': instance.parentId,
    };
