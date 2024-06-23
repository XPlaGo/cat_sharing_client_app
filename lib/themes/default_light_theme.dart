import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getDefaultLightTheme(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    dividerColor: const Color.fromRGBO(0, 0, 0, 0.1),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFBC304),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFFFFFFFF),
      onTertiary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFEEEEEE),
      onPrimaryContainer: Color(0xFFCCCCCC),
      background: Color(0xFFFFFFFF),
      shadow: Color.fromRGBO(0, 0, 0, 0.05),
      onError: Color(0xFFFFFFFF),
      error: Color(0xFFF54444),
      surface: Color(0xFFFFFFFF),
    ).copyWith(
      secondary: const Color(0xFF000000),
        tertiary: const Color(0xFF53a653)
    ),
    fontFamily: GoogleFonts.manrope().fontFamily,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.manrope(
        fontSize: 48,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
      ),
      displayMedium: GoogleFonts.manrope(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
      ),
      displaySmall: GoogleFonts.manrope(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
          color: const Color(0xFFAAAAAA)
      ),
      titleLarge: GoogleFonts.manrope(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Colors.black
      ),
      titleMedium: GoogleFonts.manrope(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black
      ),
      titleSmall: GoogleFonts.manrope(
          textStyle: textTheme.titleSmall,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      bodyLarge: GoogleFonts.manrope(
        textStyle: textTheme.bodyLarge,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        fontSize: 18,
      ),
      bodyMedium: GoogleFonts.manrope(
        textStyle: textTheme.bodyMedium,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        fontSize: 16,
      ),
      bodySmall: GoogleFonts.manrope(
        textStyle: textTheme.bodySmall,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        fontSize: 14,
      ),
      labelLarge: GoogleFonts.manrope(
        textStyle: textTheme.labelLarge,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      labelMedium: GoogleFonts.manrope(
        textStyle: textTheme.labelMedium,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      labelSmall: GoogleFonts.manrope(
        textStyle: textTheme.labelSmall,
        fontWeight: FontWeight.w600,
        fontSize: 12,
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
          statusBarIconBrightness: Brightness.dark
      ),
      elevation: 10,
    ),
  );
}
