part of '../create_new_adopted.dart';

Row _selectTypeButton(
    BuildContext context, String type, Function(String) onSelect) {
  return Row(
    children: [
      InkWell(
        onTap: () => onSelect('cats'),
        child: TypeItem(
          size: context.height * 22,
          imagePath: 'cat'.toSVG,
          title: 'cats'.translate,
          isSelected: type == 'cats',
        ),
      ),
      SizedBox(width: context.width * 5),
      InkWell(
        onTap: () => onSelect('dogs'),
        child: TypeItem(
          size: context.height * 22,
          imagePath: 'dog'.toSVG,
          title: 'dogs'.translate,
          isSelected: type == 'dogs',
        ),
      )
    ],
  );
}
