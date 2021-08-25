import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopme_admin/blocs/order_bloc/order_bloc.dart';
import 'package:shopme_admin/data/remote/models/order/order.dart';
import 'package:shopme_admin/data/schemas/request/order/request_order.dart';
import 'package:shopme_admin/data/shared_preferences/shared_pref.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/resources/app_colors.dart';
import 'package:shopme_admin/widgets/page/base_page.dart';

class OrderDetailPage extends StatefulWidget {
  final Order order;

  const OrderDetailPage({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => OrderDetailPageState();

  static MaterialPageRoute getRoute({required Order order}) {
    return MaterialPageRoute(
      builder: (context) => OrderDetailPage(order: order),
    );
  }
}

class OrderDetailPageState extends State<OrderDetailPage> {
  late OrderBloc _orderBloc;
  late ValueNotifier<bool> isShippingNotifier;
  late SharedPref _sharedPref;

  @override
  void initState() {
    super.initState();
    _orderBloc = getIt<OrderBloc>();
    _sharedPref = getIt<SharedPref>();
    if (widget.order.status == "ordered") {
      isShippingNotifier = ValueNotifier(false);
    } else {
      isShippingNotifier = ValueNotifier(true);
    }
  }

  @override
  void dispose() {
    _orderBloc.close();
    super.dispose();
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
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          children: [
            _buildShippingInfo(),
            _buildProducts(),
            _buildStatus(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatus() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.white,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Total price: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 50),
              Text(
                widget.order.totalPrice.toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Status: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 50),
              Text(
                widget.order.status,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 200),
              _buildShipButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildShipButton() {
    if(widget.order.status == "delivered") {
      return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey,
        ),
        child: Text(
          "Delivered",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      );
    }
    return ValueListenableBuilder<bool>(
      valueListenable: isShippingNotifier,
      builder: (_, isShipping, __) {
        if (!isShipping) {
          return TextButton(
            onPressed: () {
              RequestOrder request = new RequestOrder(id: widget.order.id, status: "delivering");
              _orderBloc.updateStatus(request, _sharedPref.token);
              isShippingNotifier.value = true;
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              "Ship",
              style: TextStyle(color: AppColors.white, fontSize: 18),
            ),
          );
        } else {
          return TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            child: Text(
              "Shipping",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          );
        }
      },
    );
  }

  Widget _buildProducts() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      color: AppColors.white,
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: widget.order.orderItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return _buildListItem(index);
        },
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Container(
      width: 200,
      height: 250,
      child: Card(
        child: Column(
          children: [
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(widget.order.orderItems[index].product.imageUrl),
                    fit: BoxFit.contain,
                  )),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.order.orderItems[index].product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.order.orderItems[index].product.price.toString() + " đ",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Quantity: " + widget.order.orderItems[index].quantity.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingInfo() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      color: AppColors.white,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.location_on),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.order.shippingInfo.fullName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.order.shippingInfo.phone,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.order.orderItems[0].createdDate,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.order.shippingInfo.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
