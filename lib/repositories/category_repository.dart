import 'package:shopme_admin/data/remote/datasource/category_datasource.dart';
import 'package:shopme_admin/data/remote/models/category/category.dart';
import 'package:shopme_admin/data/schemas/request/request_category/request_category.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/di/injection.dart';


abstract class CategoryRepository {
  Future<List<Category>> getAllCategories();

  Future<ResponseBase> addCategory(RequestCategory request);
}

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDatasource _categoryDatasource;

  CategoryRepositoryImpl() : _categoryDatasource = getIt<CategoryDatasource>();

  @override
  Future<List<Category>> getAllCategories() {
    return _categoryDatasource.getAllCategories();
  }

  @override
  Future<ResponseBase> addCategory(RequestCategory request) {
    return _categoryDatasource.addCategory(request);
  }
}
