import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme get theme => TextTheme(
      headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.ubuntu.toString()),
      headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.roboto.toString()),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.roboto.toString()),
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.roboto.toString()),
    );
