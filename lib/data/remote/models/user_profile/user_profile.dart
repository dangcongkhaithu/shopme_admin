import 'package:json_annotation/json_annotation.dart';
import 'package:shopme_admin/data/remote/models/user/user.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  final int id;
  final String firstname;
  final String lastname;
  final String phone;
  final String address;
  final User user;

  UserProfile({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.address,
    required this.user,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
