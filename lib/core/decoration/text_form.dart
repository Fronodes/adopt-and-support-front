import 'package:flutter/material.dart';
import '../core_shelf.dart';

class TextFormDeco {
  static InputDecoration createNewAdopted(
      BuildContext context, String labelText) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        labelStyle: context.bodyText2,
        labelText: labelText);
  }
}
