part of '../create_new_adopted.dart';

TextFormField _textFieldEditor(
    BuildContext context,
    TextEditingController _controller,
    String labelText,
    Function(String) onChange,
    Function(String) onSave) {
  return TextFormField(
    controller: _controller,
    style: context.headline4,
    onChanged: onChange,
    maxLines: null,
    decoration: TextFormDeco.createNewAdopted(context, labelText),
  );
}
