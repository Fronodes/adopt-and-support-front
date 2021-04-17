import 'package:flutter/material.dart';

import '../core_shelf.dart';

PreferredSize getAppBar(BuildContext context, String title, {Widget? icon}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(context.height * 6.6),
    child: AppBar(
      backgroundColor: context.canvas,
      brightness: Brightness.light,
      flexibleSpace: mainContainer(context, title, icon: icon),
      automaticallyImplyLeading: false,
    ),
  );
}

Widget mainContainer(BuildContext context, String title, {Widget? icon}) {
  return Padding(
    padding: context.bottomLow,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Image(
            image: 'logo'.pngLogoAsset,
            height: context.height * 4.2,
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
      style: context.headline1.copyWith(fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    ),
  );
}
