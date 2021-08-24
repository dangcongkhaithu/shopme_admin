import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Container(
    );
  }
}
