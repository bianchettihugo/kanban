import 'package:flutter/material.dart';
import 'package:kanban/core/utils/extensions.dart';
import 'package:kanban/core/widgets/cards/kanban_card.dart';
import 'package:kanban/core/widgets/utils/drag_proxy.dart';

class KanbanContainer extends StatefulWidget {
  final int index;
  final String title;
  final List<KanbanCard> cards;

  const KanbanContainer({
    required this.cards,
    this.index = 0,
    this.title = 'Section',
    super.key,
  });

  @override
  State<KanbanContainer> createState() => _KanbanContainerState();
}

class _KanbanContainerState extends State<KanbanContainer> {
  final _titleFocusNode = FocusNode();

  late List<KanbanCard> _cards;
  bool _editable = false;

  @override
  void initState() {
    _cards = [...widget.cards];
    _titleFocusNode.addListener(_checkFocus);
    super.initState();
  }

  void _changeEditState() {
    setState(() {
      _editable = !_editable;
    });
    _titleFocusNode.requestFocus();
  }

  void _checkFocus() {
    if (!_titleFocusNode.hasFocus) {
      setState(() {
        _editable = false;
      });
    }
  }

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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: ReorderableDragStartListener(
                    index: widget.index,
                    child: IgnorePointer(
                      ignoring: !_editable,
                      child: TextFormField(
                        readOnly: !_editable,
                        focusNode: _titleFocusNode,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        initialValue: widget.title,
                        style: context.text.bodyMedium.semibold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 18,
                    color: context.theme.disabledColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit_note,
                    size: 16,
                    color: _editable
                        ? context.theme.primaryColor
                        : context.theme.disabledColor,
                  ),
                  onPressed: _changeEditState,
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 16,
                    color: context.theme.disabledColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: ReorderableListView(
                buildDefaultDragHandles: false,
                scrollDirection: Axis.vertical,
                proxyDecorator: proxyDecorator,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final item = _cards.removeAt(oldIndex);
                    _cards.insert(newIndex, item);
                  });
                },
                children: [
                  for (int index = 0; index < _cards.length; index += 1)
                    KanbanCard(
                      key: ValueKey(_cards[index].index),
                      index: index,
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    super.dispose();
  }
}