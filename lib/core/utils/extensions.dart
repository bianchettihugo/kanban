import 'package:flutter/material.dart';

class Extensions {}

extension BCExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get text => Theme.of(this).textTheme;
}
