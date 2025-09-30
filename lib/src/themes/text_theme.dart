import 'package:fitness_app/src/themes/dark_theme.dart';
import 'package:fitness_app/src/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme get light => GoogleFonts.latoTextTheme()
      .apply(
        bodyColor: LightTheme.primaryTextColor,
        displayColor: LightTheme.primaryTextColor,
      )
      .copyWith(
        // Largest titles
        displayLarge: const TextStyle(
          // 24 ExtraBold
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
        displayMedium: const TextStyle(
          // 24 Bold
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        // Section titles
        headlineLarge: const TextStyle(
          // 18 Bold
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: const TextStyle(
          // 16 Bold
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: const TextStyle(
          // 16 SemiBold
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        // Regular content
        titleLarge: const TextStyle(
          // 16 Medium
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: const TextStyle(
          // 14 Bold
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: const TextStyle(
          // 14 SemiBold
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        // Body text
        bodyLarge: const TextStyle(
          // 14 Regular
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: const TextStyle(
          // 12 Medium
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: const TextStyle(
          // 12 Regular
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        // Smallest labels or captions
        labelSmall: const TextStyle(
          // 10 Regular
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      );

  static TextTheme get dark => GoogleFonts.latoTextTheme()
      .apply(
        bodyColor: DarkTheme.primaryTextColor,
        displayColor: DarkTheme.primaryTextColor,
      )
      .copyWith(
        // Largest titles
        displayLarge: const TextStyle(
          // 24 ExtraBold
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
        displayMedium: const TextStyle(
          // 24 Bold
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        // Section titles
        headlineLarge: const TextStyle(
          // 18 Bold
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: const TextStyle(
          // 16 Bold
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: const TextStyle(
          // 16 SemiBold
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        // Regular content
        titleLarge: const TextStyle(
          // 16 Medium
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: const TextStyle(
          // 14 Bold
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: const TextStyle(
          // 14 SemiBold
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        // Body text
        bodyLarge: const TextStyle(
          // 14 Regular
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: const TextStyle(
          // 12 Medium
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: const TextStyle(
          // 12 Regular
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        // Smallest labels or captions
        labelSmall: const TextStyle(
          // 10 Regular
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      );
}
