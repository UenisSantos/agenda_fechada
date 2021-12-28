import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorThemeUi {
  ColorThemeUi._();

  static ThemeData get themeData => ThemeData(
      textTheme: GoogleFonts.latoTextTheme(),
      primarySwatch: Colors.purple,
      appBarTheme: AppBarTheme(color: Color(0xffb49fcc)),
      primaryColor: Colors.purple,
      primaryColorLight: Color(0xffDE8D7B));
}
