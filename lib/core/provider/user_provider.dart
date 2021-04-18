import 'package:flutter/material.dart';

import '../core_shelf.dart';

class UserProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;
  void login(user) {
    _user = user;
    notifyListeners();
  }
}
