import 'package:flutter/material.dart';

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    this.grey = Colors.grey,
    this.blue = Colors.blue,
    this.red = Colors.red,
    this.orange = Colors.orange,
    this.yellow = Colors.yellow,
    this.green = Colors.green,
    this.teal = Colors.teal,
    this.purple = Colors.purple,
    this.pink = Colors.pink,
    this.red50 = Colors.black,
    this.red75 = Colors.black,
    this.blue50 = Colors.black,
    this.blue75 = Colors.black,
    this.yellow50 = Colors.black,
    this.yellow75 = Colors.black,
    this.green50 = Colors.black,
    this.green75 = Colors.black,
  });

  final Color grey;
  final Color blue;
  final Color red;
  final Color orange;
  final Color yellow;
  final Color green;
  final Color teal;
  final Color purple;
  final Color pink;

  final Color red50;
  final Color red75;
  final Color blue50;
  final Color blue75;
  final Color yellow50;
  final Color yellow75;
  final Color green50;
  final Color green75;

  @override
  ThemeColors copyWith({
    Color? grey,
    Color? blue,
    Color? red,
    Color? orange,
    Color? yellow,
    Color? green,
    Color? teal,
    Color? purple,
    Color? pink,
    Color? red50,
    Color? red75,
    Color? blue50,
    Color? blue75,
    Color? yellow50,
    Color? yellow75,
    Color? green50,
    Color? green75,
  }) {
    return ThemeColors(
      grey: grey ?? this.grey,
      blue: blue ?? this.blue,
      red: red ?? this.red,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      green: green ?? this.green,
      teal: teal ?? this.teal,
      purple: purple ?? this.purple,
      pink: pink ?? this.pink,
      red50: red50 ?? this.red50,
      red75: red75 ?? this.red75,
      blue50: blue50 ?? this.blue50,
      blue75: blue75 ?? this.blue75,
      yellow50: yellow50 ?? this.yellow50,
      yellow75: yellow75 ?? this.yellow75,
      green50: green50 ?? this.green50,
      green75: green75 ?? this.green75,
    );
  }

  @override
  ThemeColors lerp(ThemeColors? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      grey: Color.lerp(grey, other.grey, t) ?? grey,
      blue: Color.lerp(blue, other.blue, t) ?? blue,
      red: Color.lerp(red, other.red, t) ?? red,
      orange: Color.lerp(orange, other.orange, t) ?? orange,
      yellow: Color.lerp(yellow, other.yellow, t) ?? yellow,
      green: Color.lerp(green, other.green, t) ?? green,
      teal: Color.lerp(teal, other.teal, t) ?? teal,
      purple: Color.lerp(purple, other.purple, t) ?? purple,
      pink: Color.lerp(pink, other.pink, t) ?? pink,
      red50: Color.lerp(red50, other.red50, t) ?? red50,
      red75: Color.lerp(red75, other.red75, t) ?? red75,
      blue50: Color.lerp(blue50, other.blue50, t) ?? blue50,
      blue75: Color.lerp(blue75, other.blue75, t) ?? blue75,
      yellow50: Color.lerp(yellow50, other.yellow50, t) ?? yellow50,
      yellow75: Color.lerp(yellow75, other.yellow75, t) ?? yellow75,
      green50: Color.lerp(green50, other.green50, t) ?? green50,
      green75: Color.lerp(green75, other.green75, t) ?? green75,
    );
  }
}
