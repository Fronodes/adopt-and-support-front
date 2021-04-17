part of '../create_new_adopted.dart';

Padding _ageAndWeightSection(
    BuildContext context,
    String ageLabelText,
    String weightLabelText,
    String tempAgeText,
    String tempWeightText,
    Widget errorWidget,
    TextEditingController ageController,
    TextEditingController weightController,
    Function(String) onAgeChange,Function(String) onWeightChange,Function(String) onSave) {
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
                  ageController,
                  ageLabelText, onAgeChange, onSave),
              Text(
                '$tempAgeText',
                style: context.headline5,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              _textFieldEditor(
                  context,
                  weightController,
                  weightLabelText, onWeightChange, onSave),
              Text(
                '$tempWeightText',
                style: context.headline5,
              ),
            ],
          ),
        ),
        errorWidget
      ],
    ),
  );
}
