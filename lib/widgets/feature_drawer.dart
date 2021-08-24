import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopme_admin/pages/order/order_page.dart';
import 'package:shopme_admin/resources/app_colors.dart';

class FeatureDrawer extends StatefulWidget {
  @override
  _FeatureDrawerState createState() => _FeatureDrawerState();
}

class _FeatureDrawerState extends State<FeatureDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        color: AppColors.white,
        padding: const EdgeInsets.only(
          top: kToolbarHeight,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDrawerItem(
              "Order Management",
              () => Navigator.of(context).push(OrderPage.getRoute()),
            ),
            const SizedBox(height: 10),
            _buildDrawerItem("User Management", () {}),
            const SizedBox(height: 10),
            _buildDrawerItem("Product Management", () {}),
            const SizedBox(height: 10),
            _buildDrawerItem("Category Management", () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String content, Function() onTap) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 50,
      child: TextButton(
        onPressed: onTap,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            content,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
