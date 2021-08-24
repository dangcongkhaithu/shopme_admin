// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBase _$ResponseBaseFromJson(Map<String, dynamic> json) {
  return ResponseBase(
    success: json['success'] as bool,
    message: json['message'] as String,
    timestamp: json['timestamp'] as String,
  );
}

Map<String, dynamic> _$ResponseBaseToJson(ResponseBase instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
