import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade200),
      useMaterial3: true,
      
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          centerTitle: true));

  static Color creamColor = const Color(0xfff5f5f5);
  static Color lightBrown = const Color(0xffece6df);
  static Color darkBluish = const Color(0xff403b58);
}
