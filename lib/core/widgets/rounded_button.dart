import 'package:flutter/material.dart';

import '../core_shelf.dart';

class RoundedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const RoundedButton({required this.onPressed, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: context.mediumCircular,
      shadowColor: context.primary,
      color: context.primary,
      child: getButton(context),
    );
  }

  Widget getButton(BuildContext context) {
    return MaterialButton(
      minWidth: context.width,
      padding: context.lowSymmetric,
      onPressed: onPressed,
      animationDuration: Duration(milliseconds: 200),
      shape: context.roundedRectangularMedium,
      child: textWithStyle(context),
    );
  }

  Widget textWithStyle(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white.withOpacity(.9),
        fontWeight: FontWeight.w600,
        fontSize: context.fontSize * 1.9,
      ),
    );
  }
}
