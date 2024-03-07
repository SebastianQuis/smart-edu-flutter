import 'package:flutter/material.dart';

class AppTheme {
  static const Color color1 = Color(0xff000000);
  static const Color color2 = Color(0xff14213d);
  static const Color color3 = Color(0xfffca311);
  static const Color color4 = Color(0xff0077b6);
  static const Color color5 = Color(0xffffffff);
  static const Color color6 = Color(0xfff7f7f7);


  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppTheme.color4,
      elevation: 0,
      titleTextStyle: TextStyle(color: color5)
    )
  );

  static final darkTheme = ThemeData.dark().copyWith(
  );

}