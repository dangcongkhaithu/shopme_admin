import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopme_admin/blocs/product_bloc/product_bloc.dart';
import 'package:shopme_admin/blocs/product_bloc/product_state.dart';
import 'package:shopme_admin/data/remote/models/category/category.dart';
import 'package:shopme_admin/data/remote/models/order/order.dart';
import 'package:shopme_admin/data/schemas/request/product/request_product.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/resources/app_colors.dart';

class AddProductDialog extends StatefulWidget {
  final Category category;

  const AddProductDialog({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddProductDialogState();
}

class AddProductDialogState extends State<AddProductDialog> {
  late ProductBloc _productBloc;
  String name = "";
  String description = "";
  String imageUrl = "";
  String price = "";

  @override
  void initState() {
    super.initState();
    _productBloc = getIt<ProductBloc>();

    _productBloc.stream.listen((event) {
      if (event is AddProductSuccessState) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    _productBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      title: Text(
        "Add Product",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: Column(
          children: [
            _buildFormItem(
              "Product name: ",
              "Enter product name",
              (value) => name = value,
            ),
            _buildFormItem(
              "Description: ",
              "Enter description",
              (value) => description = value,
            ),
            _buildFormItem(
              "Image Url: ",
              "Enter image url",
              (value) => imageUrl = value,
            ),
            _buildFormItem(
              "Price: ",
              "Enter price: ",
              (value) => price = value,
            ),
            const SizedBox(height: 20),
            _buildButtonSave(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSave() {
    return SizedBox(
      width: 150,
      height: 40,
      child: TextButton(
        onPressed: () {
          if(name != "" && description != "" && imageUrl != "" && price != "") {
            RequestProduct request = new RequestProduct(
              id: 0,
              name: name,
              description: description,
              imageUrl: imageUrl,
              price: double.parse(price),
              categoryId: widget.category.id,
            );
            _productBloc.addProduct(request);
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        child: Text(
          "Save Product",
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildFormItem(String label, String hint, Function(String value) onSubmitValue, {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: (value) => onSubmitValue(value),
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
