import 'package:flutter/material.dart';
import 'package:kanban/app/views/kanban_view.dart';
import 'package:kanban/core/utils/themes.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Kanban',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      home: const KanbanView(),
    );
  }
}
