// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingInfo _$ShippingInfoFromJson(Map<String, dynamic> json) {
  return ShippingInfo(
    id: json['id'] as int,
    fullName: json['fullName'] as String,
    phone: json['phone'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$ShippingInfoToJson(ShippingInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'address': instance.address,
    };
