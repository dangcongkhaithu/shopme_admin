import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopme_admin/data/shared_preferences/shared_pref.dart';
import 'package:shopme_admin/di/injection.dart';
import 'package:shopme_admin/widgets/feature_drawer.dart';
import 'package:shopme_admin/widgets/page/base_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();

  static MaterialPageRoute getRoute() {
    return MaterialPageRoute(
      builder: (context) => HomePage(),
    );
  }
}

class HomePageState extends State<HomePage> {
  late SharedPref _sharedPref;
  late BasePageController _pageController;

  @override
  void initState() {
    super.initState();
    _sharedPref = getIt<SharedPref>();
    _pageController = BasePageController();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      drawer: FeatureDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Admin Dashboard",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
