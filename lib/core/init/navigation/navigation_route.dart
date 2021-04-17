import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../views/login/login_screen.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.login:
        return normalNavigate(LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
