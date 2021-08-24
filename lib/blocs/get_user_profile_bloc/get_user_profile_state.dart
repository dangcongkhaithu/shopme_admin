import 'package:shopme_admin/data/remote/models/user_profile/user_profile.dart';

import '../base_bloc.dart';

class GetUserProfileState extends BaseState {}

class GetUserProfileSuccessState extends GetUserProfileState {
  final UserProfile userProfile;

  GetUserProfileSuccessState({
    required this.userProfile,
  });

  @override
  List<Object?> get props => [userProfile];
}
