import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopme_admin/resources/app_colors.dart';


class BasePage extends StatefulWidget {
  final Widget child;
  final Widget? drawer;
  final BasePageController? controller;
  final bool resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final Color color;

  const BasePage({
    Key? key,
    required this.child,
    this.drawer,
    this.controller,
    this.resizeToAvoidBottomInset = false,
    this.appBar,
    this.color = AppColors.white,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class BasePageController {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  BasePageController() : _scaffoldKey = GlobalKey();

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    ScaffoldState? scaffoldState = _scaffoldKey.currentState;
    if (scaffoldState != null) {
      if (scaffoldState.isDrawerOpen) {
        Navigator.of(scaffoldState.context).pop();
      }
    }
  }
}

class _BasePageState extends State<BasePage> {
  late BasePageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? BasePageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      appBar: widget.appBar,
      key: _controller._scaffoldKey,
      drawer: widget.drawer,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      body: widget.child,
    );
  }
}
