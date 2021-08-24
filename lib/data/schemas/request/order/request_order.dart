import 'package:json_annotation/json_annotation.dart';

part 'request_order.g.dart';

@JsonSerializable()
class RequestOrder {
  final int id;
  final String status;

  RequestOrder({
    required this.id,
    required this.status
});

  factory RequestOrder.fromJson(Map<String, dynamic> json) => _$RequestOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RequestOrderToJson(this);

}