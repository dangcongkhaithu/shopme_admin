import 'package:json_annotation/json_annotation.dart';

part 'request_sign_in.g.dart';

@JsonSerializable()
class RequestSignIn {
  final String email;
  final String password;

  RequestSignIn({
   required this.email,
   required this.password,
});

  factory RequestSignIn.fromJson(Map<String, dynamic> json) => _$RequestSignInFromJson(json);

  Map<String, dynamic> toJson() => _$RequestSignInToJson(this);
}