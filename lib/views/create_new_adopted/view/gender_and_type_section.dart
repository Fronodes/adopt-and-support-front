part of '../create_new_adopted.dart';

Padding _genderAndTypeSection(
  BuildContext context,
  Widget errorWidget,
  String _errorText,
  String _selectedType,
  Gender? _gender,
  Function(String) onTypeSelect,
  Function(Gender) onGenderSelect,
) {
  return Padding(
    padding: context.mediumPadding,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('select_category'.translate, style: context.headline4),
        Padding(
          padding: context.lowPadding,
          child: _selectTypeButton(context, _selectedType, onTypeSelect),
        ),
        Text('select_gender'.translate, style: context.headline4),
        Padding(
          padding: context.lowPadding,
          child: _selectGenderButton(context, _gender, onGenderSelect),
        ),
        errorWidget
      ],
    ),
  );
}
