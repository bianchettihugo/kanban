import 'package:flutter/material.dart';
import 'package:kanban/core/widgets/dismissible_area.dart';
import 'package:kanban/core/widgets/editable_text.dart';

class KanbanView extends StatelessWidget {
  const KanbanView({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissibleArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                EditableContent(
                  text: 'TO DO',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
