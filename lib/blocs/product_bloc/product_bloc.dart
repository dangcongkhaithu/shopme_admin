import 'package:shopme_admin/blocs/product_bloc/product_state.dart';
import 'package:shopme_admin/data/remote/models/product/product.dart';
import 'package:shopme_admin/data/schemas/request/product/request_product.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/repositories/product_repository.dart';

import '../base_bloc.dart';

class ProductBloc extends BaseBloc with SingleBlocMixin {
  ProductRepository _repository = getIt<ProductRepository>();

  void getProducts() {
    single<List<Product>>(() => _repository.getProducts(),
        onSuccess: (products) => GetProductSuccessState(products: products));
  }

  void addProduct(RequestProduct request) {
    single<ResponseBase>(
      () => _repository.addProduct(request),
      onSuccess: (response) => AddProductSuccessState(response: response),
    );
  }

  void deleteProduct(int productId) {
    single<ResponseBase>(
      () => _repository.deleteProduct(productId),
      onSuccess: (response) => DeleteProductSuccessState(response: response),
    );
  }
}
