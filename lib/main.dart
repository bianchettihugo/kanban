import 'package:flutter/material.dart';
import 'package:kanban/core/widgets/cards/kanban_card.dart';
import 'package:kanban/core/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanban',
      theme: LightTheme().theme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: SizedBox(
            width: 400,
            child: KanbanCard(),
          ),
        ),
      ),
    );
  }
}
