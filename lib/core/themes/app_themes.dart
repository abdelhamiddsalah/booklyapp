import 'package:booklyapp/core/themes/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme=ThemeData(
  primaryColor: Colorss.mainColor,
  scaffoldBackgroundColor:Colorss.mainColor,
  iconTheme:const IconThemeData(color:Colorss.mainColor),
   textTheme: const TextTheme(
  bodyLarge: TextStyle(color:Colorss.mainColor),
    ),
  );
  static ThemeData darkTheme=ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  iconTheme:const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
  );
}