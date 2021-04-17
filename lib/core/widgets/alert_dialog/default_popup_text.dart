import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class DefaultPopupText extends StatelessWidget {
  final String text;
  const DefaultPopupText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.headline4,
      textAlign: TextAlign.center,
    );
  }
}
