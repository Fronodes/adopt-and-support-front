import 'package:flutter/material.dart';

import '../core_shelf.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User get user => _user!;
  void login(uuser) {
    _user = uuser;
    notifyListeners();
  }

  Future<void> addToFav(id) async {
    !_user!.favorites!.contains(id)
        ? _user!.favorites!.add(id)
        : _user!.favorites!.remove(id);
    notifyListeners();
  }
}
