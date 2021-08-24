import 'package:shopme_admin/data/schemas/response/sign_in/response_sign_in.dart';

import '../base_bloc.dart';

class SignInState extends BaseState {}

class SignInSuccessState extends BaseState {
  final ResponseSignIn response;

  SignInSuccessState({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}
