import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';
import './components/components_shelf.dart';
import 'functions/functions_shelf.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: context.height * 65,
          width: context.width * 65,
          child: RoundedCard(
            child: Row(children: [leftSide(), rightSide()]),
          ),
        ),
      ),
    );
  }

  Widget leftSide() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: context.leftMedium,
        child: Image(image: 'logo'.pngLogoAsset),
      ),
    );
  }

  Widget rightSide() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: context.bottomMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            upperPart(),
            LoginForm(save: save, formKey: formKey),
            loginButton()
          ],
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      margin: context.topMedium,
      height: context.height * 6.7,
      width: context.width * 30,
      child: RoundedButton(
        onPressed: () => login(email, password, context, formKey),
        text: getText('login'),
      ),
    );
  }

  Widget upperPart() {
    return Column(
      children: [
        Text(getText('welcome'), style: context.headline1),
        Container(
          constraints: BoxConstraints(maxWidth: context.width * 25),
          padding: context.topMedium,
          child: DividerWidget(color: Colors.black54),
        )
      ],
    );
  }

  void save(String text, isPassword) {
    if (isPassword) {
      password = text;
    } else {
      email = text;
    }
  }
}
