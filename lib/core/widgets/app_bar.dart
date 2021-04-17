import 'package:flutter/material.dart';

import '../core_shelf.dart';

PreferredSize getAppBar(BuildContext context, String title, {Widget? icon}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(context.height * 8),
    child: AppBar(
      backgroundColor: context.canvas,
      brightness: Brightness.light,
      flexibleSpace: mainContainer(context, title, icon: icon),
      automaticallyImplyLeading: false,
    ),
  );
}

Widget mainContainer(BuildContext context, String title, {Widget? icon}) {
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
        Expanded(flex: 6, child: screenText(context, title)),
        Expanded(child: icon ?? Container())
      ],
    ),
  );
}

Widget screenText(BuildContext context, title) {
  return Padding(
    padding: context.topLow,
    child: Text(
      title,
      style: context.headline3,
      textAlign: TextAlign.center,
    ),
  );
}
