import 'package:shopme_admin/data/remote/datasource/order_datasource.dart';
import 'package:shopme_admin/data/remote/models/order/order.dart';
import 'package:shopme_admin/data/schemas/request/order/request_order.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/di/injection.dart';


abstract class OrderRepository {

  Future<List<Order>> getAllOrders(String token);

  Future<ResponseBase> updateStatus(RequestOrder request, String token);
}

class OrderRepositoryImpl extends OrderRepository {
  final OrderDatasource _datasource;

  OrderRepositoryImpl() : _datasource = getIt<OrderDatasource>();


  @override
  Future<List<Order>> getAllOrders(String token) {
    return _datasource.getAllOrders(token);
  }

  @override
  Future<ResponseBase> updateStatus(RequestOrder request, String token) {
    return _datasource.updateStatus(request, token);
  }

}
