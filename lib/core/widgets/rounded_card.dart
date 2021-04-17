import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';

class RoundedCard extends StatelessWidget {
  final Widget child;
  const RoundedCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.canvas,
      shadowColor: context.primary,
      elevation: 2,
      shape: context.roundedRectangularMedium,
      child: child,
    );
  }
}
