import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static get theme => ThemeData(
      primaryColor: const Color(0xff3E7BFA),
      scaffoldBackgroundColor: const Color(0xffF8F8F8),
      cardColor: const Color(0xffFFFFFF),
      disabledColor: const Color(0xff8F90A6),
      unselectedWidgetColor: const Color(0xff708194),
      canvasColor: const Color(0xffF2F2F2),
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: const Color(0xff28293D),
        displayColor: const Color(0xff28293D),
      ),
      colorScheme: const ColorScheme.light(
          primary: Color(0xff3E7BFA),
          secondary: Color(0xff39D98A),
          surface: Color(0xffFFFFFF),
          background: Color(0xffF8F8F8),
          error: Color(0xffFF3B3B),
          onPrimary: Color(0xffFFFFFF),
          onSecondary: Color(0xffFFFFFF),
          onError: Color(0xffFFFFFF),
          onBackground: Color(0xff28293D),
          onSurface: Color(0xff28293D)));
}

class DarkTheme {
  static get theme => ThemeData(
      primaryColor: const Color(0xff3E7BFA),
      scaffoldBackgroundColor: const Color(0xff1C1C28),
      cardColor: const Color(0xff28293D),
      disabledColor: const Color(0xff8F90A6),
      unselectedWidgetColor: const Color(0xff40415D),
      canvasColor: const Color(0xff1D1E2C),
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: const Color(0xffEEEFF0),
        displayColor: const Color(0xffEEEFF0),
      ),
      colorScheme: const ColorScheme.dark(
          primary: Color(0xff3E7BFA),
          secondary: Color(0xff39D98A),
          surface: Color(0xff28293D),
          background: Color(0xff1C1C28),
          error: Color(0xffFF3B3B),
          onPrimary: Color(0xffFFFFFF),
          onSecondary: Color(0xffFFFFFF),
          onError: Color(0xffFFFFFF),
          onBackground: Color(0xffFAFAFC),
          onSurface: Color(0xffFAFAFC)));
}
