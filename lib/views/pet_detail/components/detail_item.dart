import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String info;
  const DetailItem({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDeco().donateCard(context),
      height: context.height * 10,
      margin: EdgeInsets.symmetric(horizontal: context.width * 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getTitle(context),
          SizedBox(height: context.height),
          getInfo(context)
        ],
      ),
    );
  }

  Widget getTitle(BuildContext context) {
    return Text(
      title,
      style: context.headline4.copyWith(fontSize: context.fontSize * 2.2),
    );
  }

  Widget getInfo(BuildContext context) {
    return Text(
      info,
      style: context.headline4.copyWith(fontWeight: FontWeight.w500),
    );
  }
}
