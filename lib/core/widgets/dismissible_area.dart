import 'package:flutter/material.dart';

class DismissibleArea extends StatelessWidget {
  final Widget child;

  const DismissibleArea({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}
