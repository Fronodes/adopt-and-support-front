part of '../create_new_adopted.dart';

Row _stepOrder(BuildContext context, _index) {
  var stepList = List.generate(
      5,
      (index) => Expanded(
            child: Padding(
              padding: context.lowPadding,
              child: Container(
                margin: EdgeInsets.only(right: 5),
                height: context.height * 1,
                decoration: BoxDecoration(
                  color:
                      index <= _index - 1 ? context.primary : context.disabled,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ));
  return Row(children: stepList);
}
