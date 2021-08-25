import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shopme_admin/data/remote/models/category/category.dart';
import 'package:shopme_admin/data/remote/models/order/order.dart';
import 'package:shopme_admin/data/remote/models/product/product.dart';
import 'package:shopme_admin/data/remote/models/user_profile/user_profile.dart';
import 'package:shopme_admin/data/schemas/request/order/request_order.dart';
import 'package:shopme_admin/data/schemas/request/product/request_product.dart';
import 'package:shopme_admin/data/schemas/request/request_category/request_category.dart';
import 'package:shopme_admin/data/schemas/request/sign_in/request_sign_in.dart';
import 'package:shopme_admin/data/schemas/response/response_base.dart';
import 'package:shopme_admin/data/schemas/response/sign_in/response_sign_in.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://localhost:8081/api")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //User
  @POST("/user/signIn")
  Future<ResponseSignIn> signIn(@Body() RequestSignIn request);

  @GET("/user/{token}")
  Future<UserProfile> getUserProfile(@Path() String token);

  //Order
  @GET("/order/all")
  Future<List<Order>> getAllOrders(@Query("token") String token);

  @PUT("/order/update")
  Future<ResponseBase> updateStatus(@Query("token") String token, @Body() RequestOrder requestOrder);

  //Product
  @GET("/product/")
  Future<List<Product>> getProducts();

  @POST("/product/add")
  Future<ResponseBase> addProduct(@Body() RequestProduct request);

  @DELETE("/product/delete/{productId}")
  Future<ResponseBase> deleteProduct(@Path() int productId);

  //Category
  @GET("/child_category/")
  Future<List<Category>> getCategories();

  @POST("/child_category/add")
  Future<ResponseBase> addCategory(@Body() RequestCategory request);
}
