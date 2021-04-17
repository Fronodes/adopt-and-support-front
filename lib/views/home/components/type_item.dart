import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core_shelf.dart';

class TypeItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final double? size;

  const TypeItem(
      {required this.title,
      required this.imagePath,
      required this.isSelected,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? context.height * 12,
      width: size ?? context.height * 12,
      decoration: BoxDeco().typeItemDeco(context, isSelected),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: getImage(context)),
          Padding(
            padding: context.verticalLow,
            child: getText(context),
          )
        ],
      ),
    );
  }

  Widget getImage(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: context.width * 7,
      color: isSelected ? context.primary : Color(0xFF8F939D),
    );
  }

  Widget getText(BuildContext context) {
    return Text(
      title,
      style: context.headline5.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: context.fontSize * 2.2,
        color: isSelected ? context.primary : Colors.black38,
      ),
    );
  }
}
