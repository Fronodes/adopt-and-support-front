import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: MaterialColor(4293818650, {
    50: Color(0xfffdf1e7),
    100: Color(0xfffbe3d0),
    200: Color(0xfff8c7a0),
    300: Color(0xfff4ac71),
    400: Color(0xfff19041),
    500: Color(0xffed7412),
    600: Color(0xffbe5d0e),
    700: Color(0xff8e460b),
    800: Color(0xff5f2e07),
    900: Color(0xff2f1704)
  }),
  brightness: Brightness.light,
  primaryColor: Color(0xffee791a),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: Color(0xfffbe3d0),
  primaryColorDark: Color(0xff8e460b),
  accentColor: Color(0xffed7412),
  accentColorBrightness: Brightness.dark,
  canvasColor: Color(0xfffafafa),
  scaffoldBackgroundColor: Color(0xfffafafa),
  bottomAppBarColor: Color(0xffffffff),
  cardColor: Color(0xffffffff),
  dividerColor: Color(0x1f000000),
  highlightColor: Color(0x66bcbcbc),
  splashColor: Color(0x66c8c8c8),
  selectedRowColor: Color(0xfff5f5f5),
  unselectedWidgetColor: Color(0x8a000000),
  disabledColor: Color(0x61000000),
  buttonColor: Color(0xffe0e0e0),
  toggleableActiveColor: Color(0xffbe5d0e),
  secondaryHeaderColor: Color(0xfffdf1e7),
  backgroundColor: Color(0xfff8c7a0),
  dialogBackgroundColor: Color(0xffffffff),
  indicatorColor: Color(0xffed7412),
  hintColor: Color(0x8a000000),
  errorColor: Color(0xffd32f2f),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xffee791a),
      primaryVariant: Color(0xff8e460b),
      secondary: Color(0xffed7412),
      secondaryVariant: Color(0xff8e460b),
      surface: Color(0xffffffff),
      background: Color(0xfff8c7a0),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onBackground: Color(0xffffffff),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Color(0xffee791a),
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      color: Color(0x8a000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline3: TextStyle(
      color: Colors.white.withOpacity(.9),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headline4: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline5: TextStyle(
      color: Color(0xffee791a),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      color: Color(0x8a000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    caption: TextStyle(
      color: Color(0x8a000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
        color: Color(0xdd000000),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: 1),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
        color: Color(0xdd000000).withOpacity(.7),
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        letterSpacing: .4),
    errorStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    isDense: false,
    isCollapsed: false,
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: false,
    fillColor: Color(0x00000000),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color(0xdd000000),
    opacity: 1,
  ),
  primaryIconTheme: IconThemeData(
    color: Color(0xffffffff),
    opacity: 1,
  ),
  accentIconTheme: IconThemeData(
    color: Color(0xffBDBDBD),
    opacity: 1,
  ),
  sliderTheme: SliderThemeData(
    valueIndicatorTextStyle: TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color(0xffffffff),
    unselectedLabelColor: Color(0xb2ffffff),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Color(0x1f000000),
    brightness: Brightness.light,
    deleteIconColor: Color(0xde000000),
    disabledColor: Color(0x0c000000),
    labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
    labelStyle: TextStyle(
      color: Color(0xde000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
    secondaryLabelStyle: TextStyle(
      color: Color(0x3d000000),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: Color(0x3dee791a),
    selectedColor: Color(0x3d000000),
    shape: StadiumBorder(
        side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    )),
  ),
  dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  )),
);

ThemeData getLightTheme() => lightTheme;