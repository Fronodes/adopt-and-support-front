import 'package:flutter/material.dart';

import '../core_shelf.dart';

PreferredSize getAppBar(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(context.height * 8),
    child: AppBar(
      backgroundColor: context.canvas,
      brightness: Brightness.light,
      flexibleSpace: mainContainer(context, title),
      automaticallyImplyLeading: false,
    ),
  );
}

Widget mainContainer(BuildContext context, String title) {
  return Container(
    alignment: Alignment.bottomCenter,
    padding: context.leftMedium,
    child: Row(
      children: [
        Expanded(
          child: Image(
            image: 'logo'.pngLogoAsset,
            width: context.width * 12,
            fit: BoxFit.fitWidth,
          ),
        ),
        Expanded(flex: 2, child: screenText(context, title)),
        Expanded(child: Container())
      ],
    ),
  );
}

Widget screenText(BuildContext context, title) {
  return Expanded(
    child: Padding(
      padding: context.topLow,
      child: Text(
        getText(title),
        style: context.headline3,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
