import 'package:flutter/material.dart';

class Themes {
  static const Color _scaffoldLight = Color.fromARGB(255, 238, 234, 234);
  static const Color _scaffoldDark = Color.fromARGB(188, 26, 25, 25);
  static const Color _primaryLight = Color.fromARGB(255, 255, 255, 255);
  static const Color _primaryDark = Color.fromARGB(255, 0, 0, 0);
  static const Color buttonColor = Color.fromARGB(255, 217, 26, 26);
  static const Color _canvasColor = Color.fromARGB(219, 163, 163, 163);

  static ThemeData light() => ThemeData(
      canvasColor: _canvasColor,
      primaryColor: _primaryLight,
      scaffoldBackgroundColor: _scaffoldLight,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: _scaffoldLight,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: _primaryDark,
        ),
      ),
      textTheme: const TextTheme(
        bodyText1:  TextStyle(
            fontSize: 14,
            color: _canvasColor,
            fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
            fontSize: 16, color: _primaryDark, fontWeight: FontWeight.w500),
      ));

  static ThemeData dark() => ThemeData(
      canvasColor: _canvasColor,
      primaryColor: _primaryDark,
      scaffoldBackgroundColor: _scaffoldDark,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: _scaffoldDark,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: _primaryLight,
        ),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 14,
            color: _canvasColor,
            fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
            fontSize: 16, color: _primaryLight, fontWeight: FontWeight.w600),
      ));
}
