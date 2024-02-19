import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade200),
      useMaterial3: true,
      cardColor: Colors.white,
      canvasColor: creamColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(darkBluish))),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: darkBluish),
      primaryColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: darkBluish,
      ),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          centerTitle: true));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      useMaterial3: true,
      cardColor: Colors.black,
      canvasColor: darkCream,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(lightBluish))),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: lightBluish),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: Colors.black),
      primaryColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: lightBluish,
      ),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          centerTitle: true));
  static Color creamColor = const Color(0xffece6df);
  static Color darkCream = Vx.gray800;
  static Color darkBluish = Vx.teal800;
  static Color lightBluish = Vx.teal500;
}
