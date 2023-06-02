import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kanban/core/utils/extensions.dart';
import 'package:kanban/core/widgets/editable_text.dart';
import 'package:kanban/core/widgets/kanban_card.dart';

class KanbanSection extends StatefulWidget {
  final int index;
  final String title;

  const KanbanSection({
    required this.index,
    this.title = 'Section',
    super.key,
  });

  @override
  State<KanbanSection> createState() => _KanbanSectionState();
}

class _KanbanSectionState extends State<KanbanSection> {
  final List<int> _items = List<int>.generate(3, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.canvasColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(right: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
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
            Row(
              children: [
                Expanded(
                  child: ReorderableDragStartListener(
                    index: widget.index,
                    child: EditableContent(text: widget.title),
                  ),
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.plus,
                    size: 18,
                    color: context.theme.disabledColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.xmark,
                    size: 18,
                    color: context.theme.disabledColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 30),
            const SingleChildScrollView(
              child: Column(
                children: [
                  KanbanCard(
                    index: 0,
                    title: 'Feed Research',
                    description:
                        'Another small and descriptive text about the task that may...',
                  ),
                  KanbanCard(
                    index: 1,
                    title: 'Feed Research',
                    description:
                        'Another small and descriptive text about the task that may...',
                  ),
                  KanbanCard(
                    index: 2,
                    title: 'Feed Research',
                    description:
                        'Another small and descriptive text about the task that may...',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
