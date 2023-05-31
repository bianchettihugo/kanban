import 'package:flutter/material.dart';
import 'package:kanban/core/widgets/dismissible_area.dart';
import 'package:kanban/core/widgets/sidebar.dart';

class AppView extends StatelessWidget {
  final Widget child;
  const AppView({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DismissibleArea(
      child: Scaffold(
        body: Row(
          children: [
            const Sidebar(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
