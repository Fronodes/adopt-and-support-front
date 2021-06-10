import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

Future<String> editText(String initialText, BuildContext context) async {
  var text = initialText;
  await CustomDialog(
    content: Material(
      color: Colors.transparent,
      child: TextField(
        controller: TextEditingController(text: initialText),
        maxLength: 30,
        onChanged: (val) => text = val,
      ),
    ),
    rightButtonText: 'ok'.translate,
  ).show(context);
  return text;
}
