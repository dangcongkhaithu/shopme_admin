import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:shopme_admin/data/remote/models/product/product.dart';
import 'package:shopme_admin/data/remote/service/api_service.dart';
import 'package:shopme_admin/data/schemas/request/product/request_product.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/di/injection.dart';

abstract class ProductDatasource {
  Future<List<Product>> getProducts();

  Future<ResponseBase> addProduct(RequestProduct request);
}

class ProductDatasourceImpl extends ProductDatasource {
  final RestClient _client;

  ProductDatasourceImpl() : _client = getIt<RestClient>();

  Logger _logger = Logger();

  @override
  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    await _client.getProducts().then((value) => products = value).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          _logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
      }
    });

    return products;
  }

  @override
  Future<ResponseBase> addProduct(RequestProduct request) async {
    late ResponseBase response;
    await _client.addProduct(request).then((value) => response = value).catchError((Object obj) {
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
