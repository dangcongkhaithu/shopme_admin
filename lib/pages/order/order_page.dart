import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopme_admin/blocs/order_bloc/order_bloc.dart';
import 'package:shopme_admin/blocs/order_bloc/order_state.dart';
import 'package:shopme_admin/data/remote/models/order/order.dart';
import 'package:shopme_admin/data/shared_preferences/shared_pref.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/pages/order/order_detail_page.dart';
import 'package:shopme_admin/resources/app_colors.dart';
import 'package:shopme_admin/widgets/page/base_page.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderPageState();

  static MaterialPageRoute getRoute() {
    return MaterialPageRoute(
      builder: (context) => OrderPage(),
    );
  }
}

class OrderPageState extends State<OrderPage> {
  late OrderBloc _orderBloc;
  late SharedPref _sharedPref;

  @override
  void initState() {
    _orderBloc = getIt<OrderBloc>();
    _sharedPref = getIt<SharedPref>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Order Management",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      color: AppColors.background,
      child: _buildPage(),
    );
  }

  Widget _buildPage() {
    _orderBloc.getAllOrders(_sharedPref.token);
    return Column(
      children: [
        _buildTitleBar(),
        const SizedBox(height: 20),
        BlocBuilder(
          bloc: _orderBloc,
          builder: (_, state) {
            if (state is GetAllOrderSuccessState) {
              List<Order> orders = state.orders.reversed.toList();
              return Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (_, index) => _buildOrderItem(index, orders),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildOrderItem(int index, List<Order> orders) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  orders[index].id.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(orders[index].shippingInfo.fullName),
                    Text(orders[index].shippingInfo.phone),
                    Text(orders[index].shippingInfo.address),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                orders[index].totalPrice.toString() + " đ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            _buildStatusText(orders[index].status),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(OrderDetailPage.getRoute(order: orders[index]));
                },
                child: Text("Show detail"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusText(String text) {
    if (text == "ordered") {
      return Expanded(
        flex: 1,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if(text == "delivering") {
      return Expanded(
        flex: 1,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return Expanded(
        flex: 1,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  Widget _buildTitleBar() {
    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "ORDER ID",
                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                "SHIPPING INFO",
                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 1,
              child: Text(
                "TOTAL PRICE",
                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 1,
              child: Text(
                "STATUS",
                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 1,
              child: Text(
                "ACTION",
                style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
