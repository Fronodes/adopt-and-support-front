import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../core_shelf.dart';

class AddImageLargeButton extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  final Function(File) onPressed;
  final String type;
  AddImageLargeButton({required this.onPressed, this.type = 'pick'});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: context.canvas,
        shadowColor: context.primary.withOpacity(.8),
        elevation: 2,
      ),
      onPressed: () async {
        if (type == 'newPage') {
          onPressed(File('null'));
          return;
        }
        var source = await _picker.getImage(source: ImageSource.gallery);
        var _file = File(source!.path);
        onPressed(_file);
      },
      child: Container(
        child: Icon(
          Icons.add,
          color: context.primary,
          size: context.width * 9,
        ),
      ),
    );
  }
}
