import 'package:flutter/material.dart';

import '../core_shelf.dart';

PreferredSize getAppBar(BuildContext context, String title, String type,
    {Function? func}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(context.height * 6.6),
    child: AppBar(
      backgroundColor: context.canvas,
      brightness: Brightness.light,
      flexibleSpace: mainContainer(context, title, type, func: func),
      automaticallyImplyLeading: false,
    ),
  );
}

Widget mainContainer(BuildContext context, String title, String type,
    {Function? func}) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: EdgeInsets.only(
          left: context.width * 4, bottom: context.height * 1.4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getLeading(context, func, type),
          screenText(context, title),
          Spacer(),
          type == 'detail'
              ? favoriteIcon(context, func)
              : (type == 'close' ? closeIcon(context) : Container())
        ],
      ),
    ),
  );
}

Widget closeIcon(BuildContext context) {
  return Padding(
    padding: context.rightHigh,
    child: InkWell(
      onTap: () => NavigationService.instance.pop(),
      child: Icon(
        Icons.close,
        color: Colors.black54,
        size: context.width * 6.2,
      ),
    ),
  );
}

Widget getLeading(BuildContext context, func, String type) {
  return type != 'detail'
      ? Image(
          image: 'logo'.pngLogoAsset,
          height: context.height * 4.2,
        )
      : InkWell(
          onTap: () => NavigationService.instance.pop(),
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black54,
            size: context.width * 7,
          ),
        );
}

Widget screenText(BuildContext context, title) {
  return Padding(
    padding: EdgeInsets.only(left: context.width * 3),
    child: Text(
      title,
      style: context.headline1.copyWith(fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    ),
  );
}

Widget favoriteIcon(BuildContext context, func) {
  //TODO: Providerdan alınacak
  var isFavorite = false;
  return Padding(
    padding: context.rightHigh,
    child: InkWell(
      onTap: func,
      child: Icon(
        Icons.favorite_border_outlined,
        color: Colors.red,
        size: context.width * 5.8,
      ),
    ),
  );
}
