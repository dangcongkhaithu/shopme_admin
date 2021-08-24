// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseSignIn _$ResponseSignInFromJson(Map<String, dynamic> json) {
  return ResponseSignIn(
    status: json['status'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$ResponseSignInToJson(ResponseSignIn instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
    };
