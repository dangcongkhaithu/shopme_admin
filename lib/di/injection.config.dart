import 'package:get_it/get_it.dart';
import 'package:shopme_admin/blocs/get_user_profile_bloc/get_user_profile_bloc.dart';
import 'package:shopme_admin/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:shopme_admin/data/remote/datasource/category_datasource.dart';
import 'package:shopme_admin/data/remote/datasource/order_datasource.dart';
import 'package:shopme_admin/data/remote/datasource/product_datasource.dart';
import 'package:shopme_admin/data/remote/datasource/user_datasource.dart';
import 'package:shopme_admin/data/remote/service/api_service.dart';
import 'package:shopme_admin/data/shared_preferences/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:shopme_admin/repositories/category_repository.dart';
import 'package:shopme_admin/repositories/order_repository.dart';
import 'package:shopme_admin/repositories/product_repository.dart';
import 'package:shopme_admin/repositories/user_repository.dart';

GetIt $initGetIt(GetIt getIt) {
  getIt.registerSingleton<RestClient>(RestClient(Dio(BaseOptions(contentType: "application/json"))));
  getIt.registerSingleton(SharedPref());

  registerDataSource(getIt);
  registerRepository(getIt);
  registerBloC(getIt);

  return getIt;
}

void registerDataSource(GetIt getIt) {
  getIt.registerLazySingleton<UserDatasource>(() => UserDatasourceImpl());
  getIt.registerLazySingleton<CategoryDatasource>(() => CategoryDatasourceImpl());
  getIt.registerLazySingleton<ProductDatasource>(() => ProductDatasourceImpl());
  getIt.registerLazySingleton<OrderDatasource>(() => OrderDatasourceImpl());
}

void registerRepository(GetIt getIt) {
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl());
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());
  getIt.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl());
}

void registerBloC(GetIt getIt) {
  getIt.registerFactory<SignInBloc>(() => SignInBloc());
  getIt.registerFactory<GetUserProfileBloc>(() => GetUserProfileBloc());
}
