import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

void login(String email, String password, BuildContext context,
    GlobalKey<FormState> formKey) {
  if (formKey.currentState != null) {
    if (!formKey.currentState!.validate()) return;
  }
  //TODO: Login Functionality
  var userIndex = -1;
  if (userIndex == -1) {
    showDialog(context, 'user_not_found');
    //TODO: Password match control
  } else if (false) {
    showDialog(context, 'wrong_password');
    //TODO: Authority check
  } else if (false) {
    Navigator.of(context).pushNamed(NavigationConstants.home);
  } else if (true) {
    Navigator.of(context).pushNamed(NavigationConstants.home);
  }
}

void showDialog(context, String textKey) {
  CustomDialog(
    content: DefaultPopupText(text: getText(textKey)),
    rightButtonText: getText('ok'),
  ).show(context);
}
