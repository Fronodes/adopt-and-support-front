import 'package:flutter/material.dart';

import '../core_shelf.dart';

class DefaultIcon extends StatelessWidget {
  final IconData icon;
  const DefaultIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: context.primary,
      size: context.width * 2,
    );
  }
}
