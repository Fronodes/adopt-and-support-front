part of '../create_new_adopted.dart';

Row _buttons(BuildContext context, int index, Function() goback,
    Function(String) onSave) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      index == 1
          ? Container()
          : GestureDetector(
              onTap: goback,
              child: Text('go_back'.translate),
            ),
      FloatingActionButton(
        foregroundColor: context.canvas,
        onPressed: () => onSave(''),
        child: Icon(index == 6 ? Icons.done : Icons.arrow_right_alt),
      ),
    ],
  );
}
