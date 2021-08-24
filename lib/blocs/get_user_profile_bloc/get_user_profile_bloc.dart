import 'package:shopme_admin/data/remote/models/user_profile/user_profile.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/repositories/user_repository.dart';


import '../base_bloc.dart';
import 'get_user_profile_state.dart';

class GetUserProfileBloc extends BaseBloc with SingleBlocMixin {
  final UserRepository _repository = getIt<UserRepository>();

  void getUserProfile(String token) {
    single<UserProfile>(
      () => _repository.getUserprofile(token),
      onSuccess: (userProfile) => GetUserProfileSuccessState(userProfile: userProfile),
    );
  }

}
