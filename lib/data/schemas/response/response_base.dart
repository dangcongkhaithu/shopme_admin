import 'package:json_annotation/json_annotation.dart';

part 'response_base.g.dart';

@JsonSerializable()
class ResponseBase {
  final bool success;
  final String message;
  final String timestamp;

  ResponseBase({
    required this.success,
    required this.message,
    required this.timestamp,
});

  factory ResponseBase.fromJson(Map<String, dynamic> json) => _$ResponseBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseBaseToJson(this);
}