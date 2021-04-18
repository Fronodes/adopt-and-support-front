import 'package:flutter/material.dart';

import '../core_shelf.dart';

class RoundedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final BorderRadius? radius;
  const RoundedButton({required this.onPressed, this.text = '', this.radius});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      borderRadius: radius ?? context.mediumCircular,
      shadowColor: context.primary.withOpacity(.9),
      color: context.primary.withOpacity(.8),
      child: getButton(context),
    );
  }

  Widget getButton(BuildContext context) {
    return MaterialButton(
      minWidth: context.width,
      padding: context.lowSymmetric,
      onPressed: onPressed,
      animationDuration: Duration(milliseconds: 200),
      child: textWithStyle(context),
    );
  }

  Widget textWithStyle(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white.withOpacity(.9), fontWeight: FontWeight.w600),
    );
  }
}
