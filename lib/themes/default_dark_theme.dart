import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

ThemeData getDefaultDarkTheme(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFFBC304),
      primaryContainer: Color(0xFF222222),
      onPrimaryContainer: Color(0xFF111111),
      background: Color(0xFF000000),
      shadow: Color.fromRGBO(0, 0, 0, 0.5),
      error: Color(0xFFF54444),
      secondary: Color(0xFF199A65),
      surface: Color(0xFF222222),
    ),
    fontFamily: GoogleFonts.manrope().fontFamily,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.manrope(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFFFFFFF),
      ),
      displaySmall: GoogleFonts.manrope(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFFFFFFF),
      ),
      titleLarge: GoogleFonts.manrope(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFFFFFFF),

      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: const Color(0xFFFFFFFF),
      ),
      titleSmall: GoogleFonts.manrope(
        textStyle: textTheme.titleSmall,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFFFFFFF),
      ),
      bodyLarge: GoogleFonts.manrope(
        textStyle: textTheme.bodyLarge,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        fontSize: 18,
        color: const Color(0xFFFFFFFF),
      ),
      bodyMedium: GoogleFonts.manrope(
        textStyle: textTheme.bodyMedium,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        fontSize: 16,
        color: const Color(0xFFFFFFFF),
      ),
      bodySmall: GoogleFonts.manrope(
        textStyle: textTheme.bodySmall,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        fontSize: 14,
        color: const Color(0xFFFFFFFF),
      ),
      labelLarge: GoogleFonts.manrope(
        textStyle: textTheme.labelLarge,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: const Color(0xFFFFFFFF),
      ),
      labelMedium: GoogleFonts.manrope(
        textStyle: textTheme.labelMedium,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: const Color(0xFFFFFFFF),
      ),
      labelSmall: GoogleFonts.manrope(
        textStyle: textTheme.labelSmall,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: const Color(0xFFFFFFFF),
      ),
    ),
    primaryColor: Colors.blue,
    shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    buttonTheme: const ButtonThemeData(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      elevation: 10,
    ),
  );
}