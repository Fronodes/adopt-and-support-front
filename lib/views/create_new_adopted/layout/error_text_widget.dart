part of '../create_new_adopted.dart';

Widget getErrorWidget(BuildContext context, String errorText) {
  if (errorText != '') {
    print('$errorText');
    return Padding(
      padding: context.mediumPadding,
      child: Text(
        errorText,
        style: context.bodyText1.copyWith(color: context.error),
      ),
    );
  } else {
    return Container();
  }
}
