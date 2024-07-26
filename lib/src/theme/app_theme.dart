import 'package:crud/gen/fonts.gen.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin AppTheme {
  static ThemeData get mainTheme => ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.primaryMedium,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: defaultTextTheme.headlineLarge,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.black,
      ),
    ),
    textTheme: defaultTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryMedium,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.gray500,
        ),
      ),
      disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.gray500,
        ),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondaryMedium,
        ),
      ),
      filled: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      labelStyle: defaultTextTheme.headlineMedium!.copyWith(color: AppColors.gray500),
      errorStyle: defaultTextTheme.headlineMedium!.copyWith(color: AppColors.redError),
      hintStyle: defaultTextTheme.bodyLarge!.copyWith(color: AppColors.gray400),
    ),

  );

  static String fontFamily() => FontFamily.roboto;

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