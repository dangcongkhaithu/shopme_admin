

import 'package:shopme_admin/data/remote/models/order/order.dart';
import 'package:shopme_admin/data/schemas/request/order/request_order.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/repositories/order_repository.dart';

import '../base_bloc.dart';
import 'order_state.dart';

class OrderBloc extends BaseBloc with SingleBlocMixin {
  final OrderRepository _repository = getIt<OrderRepository>();


  void getAllOrders(String token) {
    single<List<Order>>(
      () => _repository.getAllOrders(token),
      onSuccess: (orders) => GetAllOrderSuccessState(orders: orders),
    );
  }

  void updateStatus(RequestOrder request, String token) {
    single<ResponseBase>(
      () => _repository.updateStatus(request, token),
      onSuccess: (response) => UpdateOrderSuccessState(response: response),
    );
  }
}
