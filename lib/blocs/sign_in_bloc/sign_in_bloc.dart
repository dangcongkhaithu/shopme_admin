import 'package:shopme_admin/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:shopme_admin/data/schemas/request/sign_in/request_sign_in.dart';
import 'package:shopme_admin/data/schemas/response/sign_in/response_sign_in.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/repositories/user_repository.dart';

import '../base_bloc.dart';

class SignInBloc extends BaseBloc with SingleBlocMixin {
  final UserRepository _repository = getIt<UserRepository>();

  void signIn(RequestSignIn request) {
    single<ResponseSignIn>(
      () => _repository.signIn(request),
      onSuccess: (response) => SignInSuccessState(response: response),
    );
  }
}
