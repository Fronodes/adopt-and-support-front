import 'dart:ui' as ui;

import 'package:flutter/material.dart';

var window = WidgetsBinding.instance?.window ?? ui.window;

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension ResponsiveExtension on BuildContext {
  double get height => mediaQuery.size.height * 0.01;
  double get width => mediaQuery.size.width * 0.01;
  double get low => (height + width) / 2;
  double get medium => height + width;
  double get high => (height + width) * 2;
  double get extreme => (height + width) * 4;
  double get fontSize => (height + width) / 2;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get accent => theme.accentColor;
  Color get primary => theme.primaryColor;
  Color get canvas => theme.canvasColor;
  TextStyle get headline1 =>
      theme.textTheme.headline1!.copyWith(fontSize: fontSize * 4.1);
  TextStyle get headline2 =>
      theme.textTheme.headline2!.copyWith(fontSize: fontSize * 3.4);
  TextStyle get headline3 =>
      theme.textTheme.headline3!.copyWith(fontSize: fontSize * 3);
  TextStyle get headline4 =>
      theme.textTheme.headline4!.copyWith(fontSize: fontSize * 2.4);
  TextStyle get headline5 =>
      theme.textTheme.headline5!.copyWith(fontSize: fontSize * 2);
  TextStyle get headline6 =>
      theme.textTheme.headline6!.copyWith(fontSize: fontSize * 1.8);
}

extension DurationExtension on BuildContext {
  Duration get tooFast => Duration(milliseconds: 200);
  Duration get fast => Duration(milliseconds: 500);
  Duration get normal => Duration(milliseconds: 800);
  Duration get slow => Duration(seconds: 1);
  Duration get tooSlow => Duration(seconds: 2);
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get lowCircular => BorderRadius.circular(5);
  BorderRadius get mediumCircular => BorderRadius.circular(10);
  BorderRadius get highCircular => BorderRadius.circular(15);
}

extension ShapeBorderExtension on BuildContext {
  ShapeBorder get roundedRectangularLow =>
      RoundedRectangleBorder(borderRadius: lowCircular);
  ShapeBorder get roundedRectangularMedium =>
      RoundedRectangleBorder(borderRadius: mediumCircular);
  ShapeBorder get roundedRectangularHigh =>
      RoundedRectangleBorder(borderRadius: highCircular);
}

extension AllPaddingExtension on BuildContext {
  EdgeInsets get lowPadding => EdgeInsets.all(low);
  EdgeInsets get mediumPadding => EdgeInsets.all(medium);
  EdgeInsets get highPadding => EdgeInsets.all(high);
  EdgeInsets get extremePadding => EdgeInsets.all(extreme);
}

extension SymmetricPaddingExtension on BuildContext {
  EdgeInsets get verticalLow => EdgeInsets.symmetric(vertical: low);
  EdgeInsets get verticalMedium => EdgeInsets.symmetric(vertical: medium);
  EdgeInsets get verticalHigh => EdgeInsets.symmetric(vertical: high);
  EdgeInsets get verticalExtreme => EdgeInsets.symmetric(vertical: extreme);

  EdgeInsets get horizontalLow => EdgeInsets.symmetric(horizontal: low);
  EdgeInsets get horizontalMedium => EdgeInsets.symmetric(horizontal: medium);
  EdgeInsets get horizontalHigh => EdgeInsets.symmetric(horizontal: high);
  EdgeInsets get horizontalExtreme => EdgeInsets.symmetric(horizontal: extreme);

  EdgeInsets get lowSymmetric =>
      EdgeInsets.symmetric(horizontal: low, vertical: low);
  EdgeInsets get mediumSymmetric =>
      EdgeInsets.symmetric(horizontal: medium, vertical: medium);
  EdgeInsets get highSymmetric =>
      EdgeInsets.symmetric(horizontal: high, vertical: high);
  EdgeInsets get extremeSymmetric =>
      EdgeInsets.symmetric(horizontal: extreme, vertical: extreme);
}

extension LeftPaddingExtension on BuildContext {
  EdgeInsets get leftLow => EdgeInsets.only(left: low);
  EdgeInsets get leftMedium => EdgeInsets.only(left: medium);
  EdgeInsets get leftHigh => EdgeInsets.only(left: high);
  EdgeInsets get leftExtreme => EdgeInsets.only(left: extreme);
}

extension RightPaddingExtension on BuildContext {
  EdgeInsets get rightLow => EdgeInsets.only(right: low);
  EdgeInsets get rightMedium => EdgeInsets.only(right: medium);
  EdgeInsets get rightHigh => EdgeInsets.only(right: high);
  EdgeInsets get rightExtreme => EdgeInsets.only(right: extreme);
}

extension TopPaddingExtension on BuildContext {
  EdgeInsets get topLow => EdgeInsets.only(top: low);
  EdgeInsets get topMedium => EdgeInsets.only(top: medium * 1.4);
  EdgeInsets get topHigh => EdgeInsets.only(top: high);
  EdgeInsets get topExtreme => EdgeInsets.only(top: extreme);
}

extension BottomPaddingExtension on BuildContext {
  EdgeInsets get bottomLow => EdgeInsets.only(bottom: low);
  EdgeInsets get bottomMedium => EdgeInsets.only(bottom: medium);
  EdgeInsets get bottomHigh => EdgeInsets.only(bottom: high);
  EdgeInsets get bottomExtreme => EdgeInsets.only(bottom: extreme);
}

extension BorderSideExtension on BuildContext {
  BorderSide get defaultBlack =>
      BorderSide(color: Colors.black26, width: width * .05);
  BorderSide get defaultPrimary =>
      BorderSide(color: primary, width: width * .07);
}

extension BoxBorderExtension on BuildContext {
  BoxBorder get defaultBlackBoxBorder =>
      Border.all(color: Colors.black26, width: width * .05);
}

extension BoxConstraintsExtension on BuildContext {
  BoxConstraints get iconBoxConstraints =>
      BoxConstraints.expand(width: width * 3, height: height * 4);
}

TextStyle defaultTextStyle = TextStyle(
  color: Color(0xffee791a),
  fontSize: 13,
);
