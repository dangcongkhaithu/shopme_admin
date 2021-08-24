import 'package:json_annotation/json_annotation.dart';


part 'response_sign_in.g.dart';

@JsonSerializable()
class ResponseSignIn {
  final String status;
  final String token;

  ResponseSignIn({
    required this.status,
    required this.token,
  });

  factory ResponseSignIn.fromJson(Map<String, dynamic> json) => _$ResponseSignInFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseSignInToJson(this);
}