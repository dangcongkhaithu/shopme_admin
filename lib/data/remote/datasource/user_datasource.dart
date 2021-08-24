import 'package:logger/logger.dart';
import 'package:shopme_admin/data/remote/models/user_profile/user_profile.dart';
import 'package:shopme_admin/data/remote/service/api_service.dart';
import 'package:shopme_admin/data/schemas/request/sign_in/request_sign_in.dart';
import 'package:shopme_admin/data/schemas/response/sign_in/response_sign_in.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:dio/dio.dart';

abstract class UserDatasource {
  Future<ResponseSignIn> signIn(RequestSignIn request);

  Future<UserProfile> getUserProfile(String token);
}

class UserDatasourceImpl extends UserDatasource {
  final RestClient _client;

  UserDatasourceImpl() : _client = getIt<RestClient>();

  Logger _logger = Logger();

  @override
  Future<ResponseSignIn> signIn(RequestSignIn request) async {
    late ResponseSignIn response;
    await _client.signIn(request).then((value) {
      response = value;
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          _logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
      }
    });

    return response;
  }

  @override
  Future<UserProfile> getUserProfile(String token) async {
    late UserProfile response;
    await _client.getUserProfile(token).then((value) {
      response = value;
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          _logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
      }
    });
    return response;
  }
}
