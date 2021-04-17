import 'package:flutter/material.dart';

import '../core_shelf.dart';

class LocationRow extends StatelessWidget {
  final String text;
  const LocationRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.navigation,
          color: Colors.green[300],
          size: context.width * 3.6,
        ),
        SizedBox(width: context.width * .8),
        Text(
          text,
          style: context.headline5.copyWith(
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
