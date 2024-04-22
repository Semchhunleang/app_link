import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constraints.dart';

class CustomTheme {
  static final theme = ThemeData(
    scaffoldBackgroundColor: scaffoldBackground,
    // scaffoldBackgroundColor: const Color(0xFFEDEDED),
    appBarTheme: const AppBarTheme(elevation: 0.0, shadowColor: transparent),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // selectedLabelStyle: TextStyle(color: primaryColor),
      elevation: 3,
      backgroundColor: const Color(0x00ffffff),
      selectedLabelStyle: GoogleFonts.dmSans(
          fontSize: detailFontSize, color: blackColor, fontWeight: FontWeight.w500),
      unselectedLabelStyle: GoogleFonts.dmSans(
          fontSize: detailFontSize, color: grayColor, fontWeight: FontWeight.w500),
      selectedItemColor: blackColor,
      unselectedItemColor: grayColor,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(5.0)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(5.0)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(5.0)),
      hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400, color: grayColor, fontSize: detailFontSize),
      //labelStyle: KTextStyle.inter(fs: 14.0, c: black, fw: FontWeight.w400),
      filled: true,
      fillColor: borderWithOpacityColor,
    ),
  );
}
