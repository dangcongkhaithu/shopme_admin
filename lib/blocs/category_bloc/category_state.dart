import 'package:shopme_admin/data/remote/models/category/category.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';

import '../base_bloc.dart';

abstract class CategoryState extends BaseState {}

class GetCategorySuccessState extends CategoryState {
  final List<Category> categories;

  GetCategorySuccessState({
    this.categories = const [],
  });

  @override
  List<Object?> get props => [categories];
}

class AddCategorySuccessState extends CategoryState {
  final ResponseBase response;

  AddCategorySuccessState({
    required this.response,
  });

  @override
  List<Object?> get props => [response];
}
