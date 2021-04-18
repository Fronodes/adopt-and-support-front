import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';
import '../profile/profile_screen.dart';
import 'pages/main_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, 'home_screen'.translate, 'home'),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white.withOpacity(.96),
          buttonBackgroundColor: Colors.white.withOpacity(.92),
          height: context.height * 7.8,
          items: <Widget>[
            getIcon(pageIndex == 0 ? Icons.home : Icons.home_outlined, 0),
            getIcon(
                pageIndex == 1
                    ? Icons.notifications
                    : Icons.notifications_outlined,
                1),
            getIcon(pageIndex == 2 ? Icons.person : Icons.person_outline, 2),
          ],
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
        ),
        resizeToAvoidBottomInset: false,
        body: getBody());
  }

  Widget getIcon(IconData icon, int index) {
    return Icon(
      icon,
      size: pageIndex == index ? context.width * 8.2 : context.width * 7.9,
      color: pageIndex == index ? context.primary : Colors.black54,
    );
  }

  Widget getBody() {
    return pageIndex == 0
        ? MainPage()
        : (pageIndex == 2 ? ProfileScreen() : Container());
  }
}
