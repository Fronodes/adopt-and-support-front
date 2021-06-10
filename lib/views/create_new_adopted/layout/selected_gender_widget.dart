part of '../create_new_adopted.dart';

Row _selectGenderButton(
  BuildContext context,
  Gender? _gender,
  Function(Gender) onSelect,
) {
  return Row(
    children: [
      InkWell(
        onTap: () => onSelect(Gender.male),
        child: TypeItem(
          size: context.height * 15,
          imagePath: 'male'.toSVG,
          title: 'male'.translate,
          isSelected: _gender == Gender.male,
        ),
      ),
      SizedBox(width: context.width * 5),
      InkWell(
        onTap: () => onSelect(Gender.female),
        child: TypeItem(
          size: context.height * 15,
          imagePath: 'female'.toSVG,
          title: 'female'.translate,
          isSelected: _gender == Gender.female,
        ),
      )
    ],
  );
}
