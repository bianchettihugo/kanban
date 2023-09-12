import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanban/core/widgets/themes/theme_colors.dart';

import 'base_theme.dart';

class LightTheme extends BaseTheme {
  static const _fontFamily = 'Cantarell';

  @override
  ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xff3F83F8),
        cardColor: Colors.white,
        hintColor: const Color(0xffBDBEC4),
        disabledColor: const Color(0xffBDBEC4),
        scaffoldBackgroundColor: const Color(0xffF3F5F7),
        canvasColor: const Color(0xffF9FAFD),
        dividerColor: const Color(0xffD1D5DB),
        fontFamily: _fontFamily,
        iconTheme: const IconThemeData(
          color: Color(0xff23212D),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xffF3F5F7),
          elevation: 0,
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff3F83F8),
          onPrimary: Colors.white,
          secondary: Color(0xffEEA63D),
          onSecondary: Colors.white,
          error: Color(0xffF05252),
          onError: Colors.white,
          background: Color(0xffF3F5F7),
          onBackground: Color(0xff23212D),
          surface: Colors.white,
          onSurface: Color(0xff23212D),
        ),
        extensions: const [
          ThemeColors(
            grey: Color(0xffF4F2F6),
            blue: Color(0xff3F83F8),
            red: Color(0xffF05252),
            orange: Color(0xffFF5A1F),
            yellow: Color(0xffEEA63D),
            green: Color(0xff0E9F6E),
            teal: Color(0xff0694A2),
            purple: Color(0xff9061F9),
            pink: Color(0xffE74694),
            red50: Color(0xffFDE8E8),
            red75: Color(0xffF8B4B4),
            blue50: Color(0xffE1EFFE),
            blue75: Color(0xffC3DDFD),
            yellow50: Color(0xffFDFDEA),
            yellow75: Color(0xffFDF6B2),
            green50: Color(0xffDEF7EC),
            green75: Color(0xffBCF0DA),
          ),
        ],
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: const Color(0xff23212D),
          displayColor: const Color(0xff23212D),
        ),
      );
}
