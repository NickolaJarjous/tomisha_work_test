import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class ThemesData {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryLight,
    canvasColor: AppColors.primaryText,
    colorScheme:
        ThemeData().colorScheme.copyWith(primary: AppColors.primaryLight),
    textTheme: GoogleFonts.montserratTextTheme().copyWith(
      bodyMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
      titleMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
      bodySmall: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 14, color: Colors.white)),
      displayLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
      bodyLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
    ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    hoverColor: AppColors.primaryText,
    primaryColor: AppColors.primaryDark,
    colorScheme:
        ThemeData().colorScheme.copyWith(primary: AppColors.primaryDark),
    textTheme: GoogleFonts.montserratTextTheme().copyWith(
      bodyMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 14, color: Colors.black)),
      titleMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 14, color: Colors.black)),
      bodySmall: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 14, color: Colors.black)),
      displayLarge:
          GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14)),
      displayMedium:
          GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14)),
      displaySmall:
          GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14)),
      headlineMedium:
          GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14)),
      headlineSmall:
          GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14)),
      titleLarge:
          GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14)),
      labelSmall:
          GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14)),
      titleSmall:
          GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14)),
      labelLarge:
          GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14)),
      bodyLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(fontSize: 14, color: Colors.black)),
    ),
  );
}
