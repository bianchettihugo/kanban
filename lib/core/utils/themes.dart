import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static get theme => ThemeData(
      primaryColor: const Color(0xff3E7BFA),
      scaffoldBackgroundColor: const Color(0xffE8E8E8),
      cardColor: const Color(0xffFFFFFF),
      disabledColor: const Color(0xff8F90A6),
      unselectedWidgetColor: const Color(0xffDDDDDD),
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: const Color(0xff28293D),
        displayColor: const Color(0xff28293D),
      ),
      colorScheme: const ColorScheme.light(
          primary: Color(0xff3E7BFA),
          secondary: Color(0xff39D98A),
          surface: Color(0xffFFFFFF),
          background: Color(0xffE8E8E8),
          error: Color(0xffFF3B3B),
          onPrimary: Color(0xffFFFFFF),
          onSecondary: Color(0xffFFFFFF),
          onError: Color(0xffFFFFFF),
          onBackground: Color(0xff28293D),
          onSurface: Color(0xff28293D)));
}

class DarkTheme {
  static get theme => ThemeData(
      primaryColor: const Color(0xff23A1FF),
      scaffoldBackgroundColor: const Color(0xff1C1C28),
      cardColor: const Color(0xff262C37),
      disabledColor: const Color(0xff8F90A6),
      unselectedWidgetColor: const Color(0xff40415D),
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: const Color(0xffEEEFF0),
        displayColor: const Color(0xffEEEFF0),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff23A1FF),
        secondary: Color(0xff39D98A),
        surface: Color(0xff262C37),
        background: Color(0xff1C1F2A),
        error: Color(0xffFF3B3B),
        onPrimary: Color(0xffFFFFFF),
        onSecondary: Color(0xffFFFFFF),
        onError: Color(0xffFFFFFF),
        onBackground: Color(0xffEEEFF0),
        onSurface: Color(0xffEEEFF0),
      ));
}
