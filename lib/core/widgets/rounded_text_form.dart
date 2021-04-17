import 'package:flutter/material.dart';

import '../core_shelf.dart';

class RoundedTextForm extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final String type;
  final save;

  const RoundedTextForm(
      {this.hintText = '', this.icon, required this.type, this.save});

  @override
  _RoundedTextFormState createState() => _RoundedTextFormState();
}

class _RoundedTextFormState extends State<RoundedTextForm> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: TextFormDeco().loginDeco(
          context, widget.hintText, prefixIcon(context), suffixIcon(context)),
      onChanged: (val) {
        widget.save(val, isPassword());
      },
      obscureText: isPassword() && !showPassword ? true : false,
      validator: validationFunction,
    );
  }

  Widget prefixIcon(BuildContext context) {
    return widget.icon == null ? Container() : DefaultIcon(widget.icon!);
  }

  Widget? suffixIcon(BuildContext context) {
    return isPassword()
        ? IconButton(
            padding: context.rightLow,
            color: context.canvas,
            splashRadius: 1,
            icon: DefaultIcon(
              showPassword ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          )
        : null;
  }

  String? validationFunction(val) {
    if (val == null || val.isEmpty) {
      return getText('cant_empty');
    } else if (widget.type == 'password' && val.length < 6) {
      return getText('short_pwd');
    } else if (widget.type == 'email' && !val.contains('@')) {
      return getText('invalid_email');
    }
  }

  bool isPassword() {
    return widget.type == 'password';
  }
}
