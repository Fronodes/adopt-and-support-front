import 'package:cio/views/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../views/create_new_adopted/create_new_adopted.dart';
import '../../../views/home/home_screen.dart';
import '../../../views/pet_detail/pet_detail_screen.dart';
import '../../../views/view_all/view_all.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.home:
        return normalNavigate(HomeScreen());
      case NavigationConstants.createNewAdopted:
        return normalNavigate(CreateNewAdopted());
      case NavigationConstants.petDetail:
        return normalNavigate(PetDetailScreen());
      case NavigationConstants.viewAll:
        return normalNavigate(ViewAll());
      default:
        return normalNavigate(HomeScreen());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
