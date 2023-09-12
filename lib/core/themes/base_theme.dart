import 'package:flutter/material.dart';
import 'package:kanban/core/themes/theme_colors.dart';

abstract class BaseTheme {
  ThemeData get theme;

  static ThemeColors get colors => const ThemeColors(
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
      );
}
