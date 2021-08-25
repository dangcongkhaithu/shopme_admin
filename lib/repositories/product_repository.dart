import 'package:shopme_admin/data/remote/datasource/product_datasource.dart';
import 'package:shopme_admin/data/remote/models/product/product.dart';
import 'package:shopme_admin/data/schemas/request/product/request_product.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/di/injection.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();

  Future<ResponseBase> addProduct(RequestProduct request);

  Future<ResponseBase> deleteProduct(int productId);
}

class ProductRepositoryImpl extends ProductRepository {
  final ProductDatasource _productDatasource;

  ProductRepositoryImpl() : _productDatasource = getIt<ProductDatasource>();

  @override
  Future<List<Product>> getProducts() {
    return _productDatasource.getProducts();
  }

  @override
  Future<ResponseBase> addProduct(RequestProduct request) {
    return _productDatasource.addProduct(request);
  }

  @override
  Future<ResponseBase> deleteProduct(int productId) {
    return _productDatasource.deleteProduct(productId);
  }
}
