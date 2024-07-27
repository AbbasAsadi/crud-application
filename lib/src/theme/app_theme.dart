import 'package:crud/gen/fonts.gen.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

mixin AppTheme {
  static ThemeData get mainTheme => ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.primaryMedium,
    scaffoldBackgroundColor: AppColors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 3,
      selectedItemColor: AppColors.primaryMedium,
      unselectedItemColor: AppColors.gray25,
      selectedLabelStyle: defaultTextTheme.bodySmall?.copyWith(color: AppColors.gray850),
      unselectedLabelStyle: defaultTextTheme.bodySmall?.copyWith(color: AppColors.gray25),
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 48,
      iconTheme: const IconThemeData(color: AppColors.gray50),
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: defaultTextTheme.headlineLarge,
    ),
    textTheme: defaultTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        gapPadding: 16,
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: AppColors.gray400,
        ),
      ),
      enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        gapPadding: 16,
        borderSide: const BorderSide(
          color: AppColors.gray100,
        ),
      ),
      disabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        gapPadding: 16,
        borderSide: const BorderSide(
          color: AppColors.gray100,
        ),
      ),
      focusedErrorBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        gapPadding: 16,
        borderSide: const BorderSide(
          color: AppColors.secondaryMedium,
        ),
      ),
      filled: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      labelStyle: defaultTextTheme.headlineMedium!.copyWith(color: AppColors.gray50),
      errorStyle: defaultTextTheme.headlineMedium!.copyWith(color: AppColors.redError),
      hintStyle: defaultTextTheme.bodyLarge!.copyWith(color: AppColors.gray50),
    ),

  );

  static String fontFamily() => FontFamily.roboto;

  static const double fontHeightSpacing = 1.4;

  static final TextTheme defaultTextTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    displayMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    displaySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    headlineSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
    bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, fontFamily: fontFamily(), height: fontHeightSpacing, color: AppColors.black),
  );
}