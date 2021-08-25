import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shopme_admin/blocs/base_bloc.dart';
import 'package:shopme_admin/blocs/category_bloc/category_bloc.dart';
import 'package:shopme_admin/blocs/category_bloc/category_state.dart';
import 'package:shopme_admin/blocs/product_bloc/product_bloc.dart';
import 'package:shopme_admin/blocs/product_bloc/product_state.dart';
import 'package:shopme_admin/data/remote/models/category/category.dart';
import 'package:shopme_admin/data/remote/models/product/product.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/pages/dialog/add_category_dialog.dart';
import 'package:shopme_admin/pages/dialog/add_product_dialog.dart';
import 'package:shopme_admin/pages/dialog/message_dialog.dart';
import 'package:shopme_admin/resources/app_colors.dart';
import 'package:shopme_admin/widgets/page/base_page.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductPageState();

  static MaterialPageRoute getRoute() {
    return MaterialPageRoute(
      builder: (context) => ProductPage(),
    );
  }
}

class ProductPageState extends State<ProductPage> {
  late CategoryBloc _categoryBloc;
  late ProductBloc _productBloc;
  late ValueNotifier<List<Category>> _categoryNotifier;
  late ValueNotifier<List<String>> _categoryNameNotifier;
  List<String> _categoryNames = [];
  List<Category> _categories = [];
  String dropdownValue = "";
  int selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    _categoryBloc = getIt<CategoryBloc>();
    _productBloc = getIt<ProductBloc>();

    _categoryNotifier = ValueNotifier([]);
    _categoryNameNotifier = ValueNotifier([]);

   _initializedData();
  }

  @override
  void dispose() {
    _categoryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Product Management",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      color: AppColors.background,
      child: _buildPage(),
    );
  }

  Widget _buildFilter() {
    return Row(
      children: [
        const SizedBox(width: 10),
        Text(
          "Category: ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        _buildDropdown(),
        const SizedBox(width: 400),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildAddButton() {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 30,
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AddProductDialog(
                  category: _categories[selectedCategory],
                ),
              ).then((_) {
                setState(() {
                });
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.yellow,
            ),
            child: Text(
              "Add Product",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 100,
          height: 30,
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AddCategoryDialog(),
              ).then((_) {
                setState(() {
                });
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.yellow,
            ),
            child: Text(
              "Add Category",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return ValueListenableBuilder<List<String>>(
      valueListenable: _categoryNameNotifier,
      builder: (_, categoryNames, __) {
        return DropdownButton(
          value: dropdownValue,
          onChanged: (String? value) {
            setState(() {
              (value != null) ? dropdownValue = value : dropdownValue = "";
              selectedCategory = _categoryNames.indexOf(dropdownValue);
            });
          },
          items: categoryNames
              .map<DropdownMenuItem<String>>(
                (value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildPage() {
    return Column(
      children: [
        _buildTitleBar(),
        const SizedBox(height: 20),
        ValueListenableBuilder<List<Category>>(
            valueListenable: _categoryNotifier,
            builder: (_, category, __) {
              List<Product> products = category[selectedCategory].products;
              if (products.length != 0) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (_, index) => _buildOrderItem(index, products),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }

  Widget _buildOrderItem(int index, List<Product> products) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  products[index].id.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 50,
                height: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(products[index].imageUrl),
                  fit: BoxFit.contain,
                )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                products[index].name,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                products[index].description,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                products[index].price.toString() + " đ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: CircularButton(
                  onPressed: () {
                    _productBloc.deleteProduct(products[index].id);
                  },
                  icon: Icon(Icons.delete_forever),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      color: AppColors.white,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          _buildFilter(),
          Container(
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
                      "PRODUCT ID",
                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      "IMAGE",
                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "NAME",
                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "DESCRIPTION",
                      style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "PRICE",
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
          ),
        ],
      ),
    );
  }

  void _initializedData() {
    _categoryBloc.getAllCategories();


    _categoryBloc.stream.listen((event) {
      if (event is GetCategorySuccessState) {
        _categories = event.categories;
        _categoryNotifier.value = _categories;

        event.categories.forEach((element) {
          _categoryNames.add(element.categoryName);
        });

        _categoryNameNotifier.value = _categoryNames;

        dropdownValue = _categoryNames[0];
      }
    });

    _productBloc.stream.listen((event) {
      if (event is DeleteProductSuccessState) {
        showDialog(
          context: context,
          builder: (_) => MessageDialog(message: "Delete product success"),
        ).then((_) {
          setState(() {
          });
        });
      } else if (event is ErrorState) {
        showDialog(
          context: context,
          builder: (_) => MessageDialog(message: "Something went wrong"),
        );
      }
    });
  }
}
