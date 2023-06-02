import 'package:flutter/material.dart';
import 'package:kanban/core/widgets/dismissible_area.dart';
import 'package:kanban/core/widgets/kanban_section.dart';

class KanbanView extends StatefulWidget {
  const KanbanView({super.key});

  @override
  State<KanbanView> createState() => _KanbanViewState();
}

class _KanbanViewState extends State<KanbanView> {
  final List<int> _items = List<int>.generate(3, (int index) => index);
  final List<String> _titles = ['To do', 'In progress', 'Done'];

  @override
  Widget build(BuildContext context) {
    return DismissibleArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ReorderableListView(
                buildDefaultDragHandles: false,
                scrollDirection: Axis.horizontal,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final int item = _items.removeAt(oldIndex);
                    _items.insert(newIndex, item);
                  });
                },
                children: [
                  for (int index = 0; index < _items.length; index += 1)
                    KanbanSection(
                      key: ValueKey(_items[index]),
                      index: index,
                      title: _titles[index],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
