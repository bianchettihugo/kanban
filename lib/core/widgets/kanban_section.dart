import 'package:flutter/material.dart';
import 'package:kanban/core/widgets/editable_text.dart';

class KanbanSection extends StatelessWidget {
  final int index;
  final String title;

  const KanbanSection({
    required this.index,
    this.title = 'Section',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 350,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ReorderableDragStartListener(
              index: index,
              child: EditableContent(text: title),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView()
          ],
        ),
      ),
    );
  }
}
