part of '../create_new_adopted.dart';

Padding _summarySection(
    BuildContext context,
    String labelText,
    Widget errorWidget,
    TextEditingController controller,
    Function(String) onChange,
    Function(String) onSave) {
  return Padding(
    padding: context.horizontalMedium,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: _textFieldEditor(
              context, controller, labelText, onChange, onSave),
        ),
        errorWidget,
      ],
    ),
  );
}
