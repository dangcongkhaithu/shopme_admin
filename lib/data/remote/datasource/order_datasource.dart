import 'package:logger/logger.dart';
import 'package:shopme_admin/data/remote/models/order/order.dart';
import 'package:shopme_admin/data/remote/service/api_service.dart';
import 'package:shopme_admin/data/schemas/request/order/request_order.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:dio/dio.dart';

abstract class OrderDatasource {
  Future<List<Order>> getAllOrders(String token);

  Future<ResponseBase> updateStatus(RequestOrder request, String token);
}

class OrderDatasourceImpl extends OrderDatasource {
  final RestClient _client;

  OrderDatasourceImpl() : _client = getIt<RestClient>();

  Logger _logger = Logger();

  @override
  Future<List<Order>> getAllOrders(String token) async {
    late List<Order> orders = [];
    await _client.getAllOrders(token).then((value) => orders = value).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          _logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
      }
    });

    return orders;
  }

  @override
  Future<ResponseBase> updateStatus(RequestOrder request, String token) async {
    late ResponseBase responseBase;
    await _client.updateStatus(token, request).then((value) => responseBase = value).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          _logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
      }
    });

    return responseBase;
  }
}
