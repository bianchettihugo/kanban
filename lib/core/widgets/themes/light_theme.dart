import 'package:flutter/material.dart';

import 'base_theme.dart';

class LightTheme extends BaseTheme {
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
        extensions: [
          BaseTheme.colors,
        ],
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 57.0,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.25,
            height: 1.12,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          displayMedium: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.16,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          displaySmall: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.22,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          headlineLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.25,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          headlineMedium: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.29,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          headlineSmall: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.33,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          titleLarge: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.27,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          titleMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            height: 1.50,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          titleSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.43,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          labelLarge: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.43,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          labelMedium: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            height: 1.33,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          labelSmall: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            height: 1.45,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          bodyLarge: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            height: 1.50,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
            height: 1.43,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
          bodySmall: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            height: 1.33,
            textBaseline: TextBaseline.alphabetic,
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Inter',
          ),
        ).apply(
          bodyColor: const Color(0xff23212D),
          displayColor: const Color(0xff23212D),
        ),
      );
}
