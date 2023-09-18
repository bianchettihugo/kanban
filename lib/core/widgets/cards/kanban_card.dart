import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/controllers/kanban_controller.dart';
import 'package:kanban/app/controllers/kanban_controller.event.dart';
import 'package:kanban/app/models/task_model.dart';
import 'package:kanban/core/widgets/chips/priority.dart';
import 'package:kanban/core/widgets/chips/priority_chip.dart';
import 'package:kanban/core/utils/extensions.dart';

class KanbanCard extends StatefulWidget {
  final TaskModel model;
  final bool editable;
  final int index;
  final int sectionIndex;

  const KanbanCard({
    required this.model,
    this.editable = false,
    this.index = 0,
    this.sectionIndex = 0,
    super.key,
  });

  @override
  State<KanbanCard> createState() => _KanbanCardState();
}

class _KanbanCardState extends State<KanbanCard> {
  KanbanController? _controller;
  final _titleFocusNode = FocusNode();
  final _titleController = TextEditingController();
  final _descriptionFocusNode = FocusNode();
  final _descriptionController = TextEditingController();
  final _priorities = [
    Priority.low,
    Priority.medium,
    Priority.hight,
  ];

  final _prioritiesString = {
    Priority.low: 'low',
    Priority.medium: 'medium',
    Priority.hight: 'hight',
  };

  final _prioritiesValues = [
    'low',
    'medium',
    'hight',
  ];

  int _priorityIndex = 0;
  late bool _editable;

  @override
  void initState() {
    _priorityIndex = _prioritiesValues.indexOf(widget.model.priority);
    _titleFocusNode.addListener(_checkFocus);
    _descriptionFocusNode.addListener(_checkFocus);
    _editable = widget.editable;
    _titleController.text = widget.model.title;
    _descriptionController.text = widget.model.description;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_editable) _titleFocusNode.requestFocus();
    });
    super.initState();
  }

  void _checkFocus() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (!_titleFocusNode.hasFocus && !_descriptionFocusNode.hasFocus) {
        _stopEdditing();
      }
    });
  }

  void _stopEdditing() {
    _controller?.add(KanbanEditTaskEvent(
      sectionIndex: widget.sectionIndex,
      index: widget.index,
      title: _titleController.text,
      description: _descriptionController.text,
      priority: _prioritiesString[_priorities[_priorityIndex]],
    ));
    setState(() {
      _editable = false;
    });
  }

  void _changePriority() {
    setState(() {
      _priorityIndex = _priorityIndex == 2 ? 0 : _priorityIndex + 1;
    });
    _controller?.add(KanbanEditTaskEvent(
      sectionIndex: widget.sectionIndex,
      index: widget.index,
      priority: _prioritiesString[_priorities[_priorityIndex]],
    ));
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
        constraints: const BoxConstraints(
          maxHeight: 230,
        ),
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
                      controller: _titleController,
                      decoration: const InputDecoration.collapsed(hintText: ''),
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
                      size: 16,
                    ),
                    onPressed: () {
                      _controller ??= context.read<KanbanController>();
                      _changeEditState();
                    },
                  ),
                ),
                ExcludeFocus(
                  child: Tooltip(
                    waitDuration: const Duration(milliseconds: 500),
                    message: 'Double tap to delete.',
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.9)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete,
                          size: 16,
                          color: context.theme.disabledColor,
                        ),
                      ),
                      onDoubleTap: () {
                        context
                            .read<KanbanController>()
                            .add(KanbanDeleteTaskEvent(
                              sectionIndex: widget.sectionIndex,
                              index: widget.index,
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: IgnorePointer(
                ignoring: !_editable,
                child: TextFormField(
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Tap on edit to add a description...',
                  ),
                  controller: _descriptionController,
                  minLines: 1,
                  maxLines: 5,
                  readOnly: !_editable,
                  focusNode: _descriptionFocusNode,
                  style: context.text.bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: 25),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  _controller ??= context.read<KanbanController>();
                  _changePriority();
                },
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
      onDragStarted: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      childWhenDragging: const SizedBox(),
      data: widget.model,
      child: _getChild(),
    );
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
