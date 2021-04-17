import 'package:flutter/material.dart';

import '../core_shelf.dart';

class BoxDeco {
  BoxDecoration searchBarDeco(BuildContext context) {
    return BoxDecoration(
      border: Border.all(color: Colors.black26, width: .9),
      borderRadius: BorderRadius.circular(20),
    );
  }

  BoxDecoration typeItemDeco(BuildContext context, bool selected) {
    return BoxDecoration(
      color: selected
          ? Colors.white.withOpacity(.58)
          : Colors.white.withOpacity(.96),
      boxShadow: [
        BoxShadow(
          offset: Offset(.8, 1.9),
          blurRadius: 12,
          spreadRadius: 2,
          color:
              selected ? context.primary.withOpacity(.3) : Colors.transparent,
        ),
      ],
      borderRadius: BorderRadius.circular(16),
    );
  }

  BoxDecoration donateCard(BuildContext context) {
    return BoxDecoration(
      color: Colors.white.withOpacity(.8),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: context.primary.withOpacity(.1),
          spreadRadius: 2.5,
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
    );
  }
}
