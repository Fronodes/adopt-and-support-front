import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() editFunction;
  final TextEditingController controller;
  const InfoRow(
      {required this.icon,
      required this.text,
      required this.editFunction,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDeco().donateCard(context),
      height: context.height * 8,
      margin: EdgeInsets.symmetric(
        horizontal: context.width * 1.2,
        vertical: context.height,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 5,
        vertical: context.height,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: getIcon(context)),
          SizedBox(width: context.width * 3),
          Expanded(flex: 8, child: getText(context)),
          Expanded(child: getEditButton(context))
        ],
      ),
    );
  }

  Widget getIcon(BuildContext context) {
    return Icon(
      icon,
      size: context.width * 5.5,
      color: context.primary.withOpacity(.9),
    );
  }

  Widget getText(BuildContext context) {
    return Text(
      text,
      style: context.headline4.copyWith(color: Colors.black54),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget getEditButton(BuildContext context) {
    return IconButton(
      color: context.primary.withOpacity(.9),
      iconSize: context.width * 5.5,
      onPressed: editFunction,
      icon: Icon(Icons.edit),
    );
  }
}
