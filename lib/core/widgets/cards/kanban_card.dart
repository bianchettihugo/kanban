import 'package:flutter/material.dart';
import 'package:kanban/core/widgets/chips/priority.dart';
import 'package:kanban/core/widgets/chips/priority_chip.dart';
import 'package:kanban/core/widgets/utils/extensions.dart';

class KanbanCard extends StatefulWidget {
  const KanbanCard({super.key});

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
  bool _editable = false;

  @override
  void initState() {
    _titleFocusNode.addListener(_checkFocus);
    _descriptionFocusNode.addListener(_checkFocus);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
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
                child: TextFormField(
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  initialValue: 'Task Title',
                  style: context.text.bodyMedium.semibold,
                  readOnly: !_editable,
                  focusNode: _titleFocusNode,
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
          TextFormField(
            decoration: const InputDecoration.collapsed(hintText: ''),
            initialValue:
                'If the style argument is null, the text will use the style from the closest enclosing DefaultTextStyle.',
            maxLines: 5,
            readOnly: !_editable,
            focusNode: _descriptionFocusNode,
            style: context.text.bodyMedium,
          ),
          const Spacer(),
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
    );
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }
}
