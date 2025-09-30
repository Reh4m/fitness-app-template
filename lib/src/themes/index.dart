import 'package:fitness_app/src/themes/dark_theme.dart';
import 'package:fitness_app/src/themes/light_theme.dart';
import 'package:fitness_app/src/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    primaryColor: LightTheme.primaryColor,
    scaffoldBackgroundColor: LightTheme.backgroundColor,
    cardColor: LightTheme.cardBackgroundColor,
    colorScheme: const ColorScheme.light(
      primary: LightTheme.primaryColor,
      onPrimary: LightTheme.onPrimaryColor,
      primaryContainer: LightTheme.primaryContainer,
      onPrimaryContainer: LightTheme.primaryColor,
      secondary: LightTheme.secondaryColor,
      onSecondary: LightTheme.onSecondaryColor,
      outline: LightTheme.primaryColor,
    ),
    textTheme: AppTextTheme.light,
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkTheme.primaryColor,
    scaffoldBackgroundColor: DarkTheme.backgroundColor,
    cardColor: DarkTheme.cardBackgroundColor,
    colorScheme: const ColorScheme.dark(
      primary: DarkTheme.primaryColor,
      onPrimary: DarkTheme.onPrimaryColor,
      primaryContainer: DarkTheme.primaryContainer,
      onPrimaryContainer: DarkTheme.primaryColor,
      secondary: DarkTheme.secondaryColor,
      onSecondary: DarkTheme.onSecondaryColor,
    ),
    textTheme: AppTextTheme.dark,
  );
}
