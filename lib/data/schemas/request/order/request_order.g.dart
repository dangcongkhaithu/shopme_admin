// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestOrder _$RequestOrderFromJson(Map<String, dynamic> json) {
  return RequestOrder(
    id: json['id'] as int,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$RequestOrderToJson(RequestOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
    };
