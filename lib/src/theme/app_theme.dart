import 'package:flutter/material.dart';

mixin AppTheme {
  static ThemeData get mainTheme => ThemeData();

  static String fontFamily() => FontFamily.timeNewRoman;

  static const double fontHeightSpacing = 1.6;

  static final TextTheme defaultTextTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing),
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing),
    displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing),
    displayMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing),
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing),
    displaySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing),
    headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing),
    headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing),
    headlineSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing),
    bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing),
    bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing),
  );
}