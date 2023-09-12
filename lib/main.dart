import 'package:flutter/material.dart';
import 'package:kanban/core/widgets/cards/kanban_card.dart';
import 'package:kanban/core/themes/light_theme.dart';
import 'package:kanban/core/widgets/containers/kanban_container.dart';

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
          child: KanbanContainer(
            index: 0,
            cards: [
              KanbanCard(
                key: ValueKey(0),
                index: 0,
              ),
              KanbanCard(
                key: ValueKey(1),
                index: 1,
              ),
              KanbanCard(
                key: ValueKey(2),
                index: 2,
              ),
              KanbanCard(
                key: ValueKey(3),
                index: 3,
              ),
              KanbanCard(
                key: ValueKey(4),
                index: 4,
              ),
              KanbanCard(
                key: ValueKey(5),
                index: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
