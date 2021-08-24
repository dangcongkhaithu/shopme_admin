import 'package:shopme_admin/data/remote/models/category/category.dart';
import 'package:shopme_admin/data/schemas/request/product/request_product.dart';
import 'package:shopme_admin/data/schemas/request/request_category/request_category.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/repositories/category_repository.dart';

import '../base_bloc.dart';
import 'category_state.dart';

class CategoryBloc extends BaseBloc with SingleBlocMixin {
  CategoryRepository _repository = getIt<CategoryRepository>();

  void getAllCategories() {
    single<List<Category>>(
      () => _repository.getAllCategories(),
      onSuccess: (categories) => GetCategorySuccessState(categories: categories),
    );
  }

  void addCategory(RequestCategory request) {
    single<ResponseBase>(
      () => _repository.addCategory(request),
      onSuccess: (response) => AddCategorySuccessState(response: response),
    );
  }
}
