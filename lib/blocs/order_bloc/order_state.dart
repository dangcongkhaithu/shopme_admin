import 'package:shopme_admin/data/remote/models/order/order.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';

import '../base_bloc.dart';

class OrderState extends BaseState {}

class GetAllOrderSuccessState extends OrderState {
  final List<Order> orders;

  GetAllOrderSuccessState({
    required this.orders,
  });

  @override
  List<Object?> get props => [orders];
}

class UpdateOrderSuccessState extends OrderState {
  final ResponseBase response;

  UpdateOrderSuccessState({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}
