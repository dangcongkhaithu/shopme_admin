import 'package:logger/logger.dart';
import 'package:shopme_admin/data/remote/models/category/category.dart';
import 'package:shopme_admin/data/remote/service/api_service.dart';
import 'package:shopme_admin/data/schemas/request/request_category/request_category.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:dio/dio.dart';

abstract class CategoryDatasource {
  Future<List<Category>> getAllCategories();

  Future<ResponseBase> addCategory(RequestCategory request);
}

class CategoryDatasourceImpl extends CategoryDatasource {
  final RestClient _client;

  CategoryDatasourceImpl() : _client = getIt<RestClient>();

  Logger _logger = Logger();

  @override
  Future<List<Category>> getAllCategories() async {
    List<Category> categories = [];
    await _client.getCategories().then((value) => categories = value).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          _logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
      }
    });

    return categories;
  }

  @override
  Future<ResponseBase> addCategory(RequestCategory request) async {
    late ResponseBase response;
    await _client.addCategory(request).then((value) => response = value).catchError((Object obj) {
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
