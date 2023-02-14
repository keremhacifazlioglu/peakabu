import 'package:flutter/material.dart';
import 'package:platform/ui/foundations/sizes.dart';
import 'package:platform/ui/foundations/typography.dart';
import 'package:platform/ui/tokens/colors.dart';

import 'foundations/colors.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: PlatformColorFoundation.scaffoldBackgroundColor,
    primaryColor: PlatformColor.primaryColor,
    primaryColorDark: PlatformColor.primaryColor,
    textTheme: textTheme(),
    // Düzenlenecek
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: PlatformColor.offWhiteColor,
      onPrimary: PlatformColor.offWhiteColor,
      secondary: PlatformColor.primaryColor,
      onSecondary: PlatformColor.primaryColor,
      background: PlatformColor.offWhiteColor,
      onBackground: PlatformColor.offWhiteColor,
      surface: PlatformColor.offBlackColor,
      onSurface: PlatformColor.offBlackColor,
      error: Colors.red,
      onError: Colors.red,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color>(PlatformColor.offWhiteColor),
      fillColor: MaterialStateProperty.all<Color>(PlatformColor.primaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            PlatformDimensionFoundations.sizeXS,
          ),
        ),
        backgroundColor: PlatformColor.primaryColor,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: PlatformColorFoundation.textColor,
      ),
      hintStyle:
          TextStyle(color: PlatformColorFoundation.textColor, fontSize: 13),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: PlatformColor.grayLightColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: PlatformColorFoundation.textColor,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      shadowColor: PlatformColorFoundation.dividerColor,
      elevation: 1,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: PlatformColorFoundation.textColor,
        fontSize: PlatformTypographyFoundation.bodyLarge,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: PlatformColor.offBlackColor,
      ),
    ),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        color: PlatformColorFoundation.textColor),
    displayMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 18,
        color: PlatformColorFoundation.textColor),
    displaySmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        color: PlatformColorFoundation.textColor),
    headlineLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        color: PlatformColorFoundation.textColor),
    headlineMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 18,
        color: PlatformColorFoundation.textColor),
    headlineSmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        color: PlatformColorFoundation.textColor),
    titleLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        color: PlatformColorFoundation.textColor),
    titleMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 18,
        color: PlatformColorFoundation.textColor),
    titleSmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        color: PlatformColorFoundation.textColor),
  );
}
