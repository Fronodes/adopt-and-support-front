import 'package:flutter/material.dart';
import '../core_shelf.dart';

class TextFormDeco {
  InputDecoration loginDeco(
      BuildContext context, String hintText, Widget prefixIcon,
      [Widget? suffixIcon]) {
    return InputDecoration(
      errorMaxLines: 1,
      prefixIconConstraints: context.iconBoxConstraints,
      suffixIconConstraints: context.iconBoxConstraints,
      enabledBorder: OutlineInputBorder(
        borderSide: context.defaultBlack,
        borderRadius: context.mediumCircular,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: context.defaultPrimary,
        borderRadius: context.mediumCircular,
      ),
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  InputDecoration pinFormDeco() {
    return InputDecoration(
      counter: Offstage(),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    );
  }

  BoxDecoration pinDeco(BuildContext context) {
    return BoxDecoration(
      border: context.defaultBlackBoxBorder,
      borderRadius: context.mediumCircular,
      color: context.primary.withOpacity(.6),
    );
  }
}
