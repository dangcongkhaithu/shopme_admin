import 'package:shopme_admin/data/remote/models/product/product.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';

import '../base_bloc.dart';

abstract class ProductState extends BaseState {}

class GetProductSuccessState extends ProductState {
  final List<Product> products;

  GetProductSuccessState({
    this.products = const [],
  });

  @override
  List<Object?> get props => [products];
}

class AddProductSuccessState extends ProductState {
  final ResponseBase response;

  AddProductSuccessState({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}

class DeleteProductSuccessState extends ProductState {
  final ResponseBase response;

  DeleteProductSuccessState({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}
