import 'package:shopme_admin/data/remote/datasource/user_datasource.dart';
import 'package:shopme_admin/data/remote/models/user_profile/user_profile.dart';
import 'package:shopme_admin/data/schemas/request/sign_in/request_sign_in.dart';
import 'package:shopme_admin/data/schemas/response/sign_in/response_sign_in.dart';
import 'package:shopme_admin/di/injection.dart';

abstract class UserRepository {
  Future<ResponseSignIn> signIn(RequestSignIn request);

  Future<UserProfile> getUserprofile(String token);
}

class UserRepositoryImpl extends UserRepository {
  final UserDatasource _datasource;

  UserRepositoryImpl() : _datasource = getIt<UserDatasource>();

  @override
  Future<ResponseSignIn> signIn(RequestSignIn request) {
    return _datasource.signIn(request);
  }

  @override
  Future<UserProfile> getUserprofile(String token) {
    return _datasource.getUserProfile(token);
  }
}
