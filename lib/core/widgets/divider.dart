import 'package:flutter/material.dart';

import './../core_shelf.dart';

class DividerWidget extends StatelessWidget {
  final Color color;
  DividerWidget({this.color = const Color(0xfffbe3d0)});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: context.height * .05,
      thickness: .3,
    );
  }
}
