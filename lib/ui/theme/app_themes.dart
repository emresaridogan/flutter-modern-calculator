import 'package:flutter/material.dart';

enum AppTheme { Light, Dark }

class AppThemes {
  final appThemeData = {
    AppTheme.Light: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xff3C6E71),
        cardColor: Color(0xff353535),
        primaryColorLight: Color(0xff6F9395),
        backgroundColor: Color(0xffF0EFEF),
        scaffoldBackgroundColor: Color(0xffFAFAFA),
        accentColor: Color(0xff000000)),
    AppTheme.Dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff3C6E71),
        cardColor: Color(0xff353535),
        primaryColorLight: Color(0xfffafafa),
        backgroundColor: Color(0xff3D6063),
        scaffoldBackgroundColor: Color(0xff6F9395),
        accentColor: Color(0xffffffff))
  };
}
