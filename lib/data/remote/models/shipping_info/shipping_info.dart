
import 'package:json_annotation/json_annotation.dart';

part 'shipping_info.g.dart';

@JsonSerializable()
class ShippingInfo {
  final int id;
  final String fullName;
  final String phone;
  final String address;

  ShippingInfo({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.address,
  });

  factory ShippingInfo.fromJson(Map<String, dynamic> json) => _$ShippingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingInfoToJson(this);
}
