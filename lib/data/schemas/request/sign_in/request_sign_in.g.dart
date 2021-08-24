// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestSignIn _$RequestSignInFromJson(Map<String, dynamic> json) {
  return RequestSignIn(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RequestSignInToJson(RequestSignIn instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
