import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final save;
  const LoginForm({required this.save, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          formField('email', context),
          formField('password', context),
        ],
      ),
    );
  }

  Widget formField(String type, BuildContext context) {
    var isEmail = type == 'email';
    return Container(
      margin: isEmail ? context.topHigh : context.topMedium,
      width: context.width * 30,
      height: context.height * 6,
      child: RoundedTextForm(
        type: isEmail ? 'email' : 'password',
        hintText: getText(isEmail ? 'email' : 'password'),
        icon: isEmail ? Icons.email : Icons.lock_outline,
        save: save,
      ),
    );
  }
}
