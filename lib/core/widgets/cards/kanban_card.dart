import 'package:flutter/material.dart';
import 'package:kanban/app/models/task_model.dart';
import 'package:kanban/core/widgets/chips/priority.dart';
import 'package:kanban/core/widgets/chips/priority_chip.dart';
import 'package:kanban/core/utils/extensions.dart';
import 'package:kanban/core/widgets/utils/expansible_container.dart';

class KanbanCard extends StatefulWidget {
  final TaskModel model;
  final bool editable;
  const KanbanCard({
    required this.model,
    this.editable = false,
    super.key,
  });

  @override
  State<KanbanCard> createState() => _KanbanCardState();
}

class _KanbanCardState extends State<KanbanCard> {
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _priorities = [
    Priority.low,
    Priority.medium,
    Priority.hight,
  ];

  int _priorityIndex = 0;
  late bool _editable;

  @override
  void initState() {
    _titleFocusNode.addListener(_checkFocus);
    _descriptionFocusNode.addListener(_checkFocus);
    _editable = widget.editable;
    super.initState();
  }

  void _checkFocus() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (!_titleFocusNode.hasFocus && !_descriptionFocusNode.hasFocus) {
        setState(() {
          _editable = false;
        });
      }
    });
  }

  void _changePriority() {
    setState(() {
      _priorityIndex = _priorityIndex == 2 ? 0 : _priorityIndex + 1;
    });
  }

  void _changeEditState() {
    setState(() {
      _editable = !_editable;
    });
    _titleFocusNode.requestFocus();
  }

  Widget _getChild([bool maxFiniteWidth = true]) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: maxFiniteWidth ? double.maxFinite : 350,
        height: 230,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: IgnorePointer(
                    ignoring: !_editable,
                    child: TextFormField(
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      initialValue: widget.model.title,
                      style: context.text.bodyMedium.semibold,
                      readOnly: !_editable,
                      focusNode: _titleFocusNode,
                    ),
                  ),
                ),
                ExcludeFocus(
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: _editable
                          ? context.theme.primaryColor
                          : context.theme.disabledColor,
                      size: 18,
                    ),
                    onPressed: _changeEditState,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: IgnorePointer(
                ignoring: !_editable,
                child: TextFormField(
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  initialValue: widget.model.description,
                  maxLines: 5,
                  readOnly: !_editable,
                  focusNode: _descriptionFocusNode,
                  style: context.text.bodyMedium,
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _changePriority,
                child: PriorityChip(
                  priority: _priorities[_priorityIndex],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: _getChild(false),
      childWhenDragging: const ExpansibleContainer(expanded: true),
      data: widget.model,
      child: _getChild(),
    );
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }
}
