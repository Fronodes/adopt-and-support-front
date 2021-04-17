part of '../create_new_adopted.dart';
Padding _nameSection(BuildContext context,Widget errorWidget,String labelText, String errorText,TextEditingController controller, Function(String) onSave) {
    return Padding(
      padding: context.horizontalMedium,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                _textFieldEditor(
                    context,
                    controller,
                    labelText,
                    (val) {},
                    onSave),
              ],
            ),
          ),
          errorWidget
        ],
      ),
    );
  }