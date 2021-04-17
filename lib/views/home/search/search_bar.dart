import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

class SearchBar extends StatefulWidget {
  SearchBar({required this.onPress});

  final Function() onPress;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        padding: context.mediumPadding,
        margin: context.verticalLow,
        decoration: BoxDeco().searchBarDeco(context),
        height: context.height * 5.8,
        child: getRow(),
      ),
    );
  }

  Widget getRow() {
    return Row(
      children: [
        Icon(
          Icons.search_outlined,
          color: context.primary,
          size: context.width * 5.4,
        ),
        SizedBox(width: context.width * 1.2),
        Text(
          'search'.translate,
          style: context.headline4,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
