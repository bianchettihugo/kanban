import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kanban/core/widgets/themes/theme_colors.dart';

class Extensions {}

extension BCExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ThemeColors get themeColors =>
      Theme.of(this).extension<ThemeColors>() ?? const ThemeColors();

  TextTheme get text => Theme.of(this).textTheme;

  ColorScheme get color => Theme.of(this).colorScheme;
}

extension BoldText on TextStyle? {
  TextStyle get bold => this!.copyWith(fontWeight: FontWeight.bold);
}

extension StringExtension on String {
  DateTime parseToDateTime(String dateFormat) {
    if (length > dateFormat.length) return DateTime.now();
    try {
      return DateFormat(dateFormat).parse(this);
    } on FormatException catch (_) {
      return DateTime.now();
    }
  }
}

extension DateTimeExtension on DateTime? {
  String parseToString(String dateFormat) {
    if (this == null) return '';
    return DateFormat(dateFormat).format(this!);
  }

  bool equals(DateTime? dateFormat) {
    if (this == null || dateFormat == null) return false;
    return DateUtils.isSameDay(this, dateFormat);
  }

  bool before(DateTime? dateFormat) {
    if (this == null || dateFormat == null) return false;
    return this!.isBefore(dateFormat);
  }
}
