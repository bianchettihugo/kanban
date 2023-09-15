import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/controllers/kanban_controller.dart';
import 'package:kanban/app/controllers/kanban_controller.event.dart';
import 'package:kanban/app/models/section_model.dart';
import 'package:kanban/core/utils/extensions.dart';
import 'package:kanban/core/widgets/cards/draggable_kanban_card.dart';
import 'package:kanban/core/widgets/utils/expansible_container.dart';

import '../../../app/models/task_model.dart';

class KanbanContainer extends StatefulWidget {
  final int index;
  final SectionModel model;

  const KanbanContainer({
    required this.model,
    this.index = 0,
    super.key,
  });

  @override
  State<KanbanContainer> createState() => _KanbanContainerState();
}

class _KanbanContainerState extends State<KanbanContainer> {
  KanbanController? _controller;
  final _titleFocusNode = FocusNode();
  final _titleController = TextEditingController();

  late List<TaskModel> _cards;
  bool _editable = false;

  @override
  void initState() {
    _cards = [...widget.model.tasks];
    _titleFocusNode.addListener(_checkFocus);
    _titleController.text = widget.model.title;
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
      _controller?.add(KanbanEditSectionEvent(
        index: widget.index,
        newTitle: _titleController.text,
      ));
      setState(() {
        _editable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
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
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ReorderableDragStartListener(
                            index: widget.index,
                            child: Container(
                              color: context.theme.canvasColor,
                              child: IgnorePointer(
                                ignoring: !_editable,
                                child: TextFormField(
                                  readOnly: !_editable,
                                  focusNode: _titleFocusNode,
                                  controller: _titleController,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  style: context.text.bodyMedium.semibold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Tooltip(
                          waitDuration: const Duration(milliseconds: 700),
                          message: 'Add a new task to this section',
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.9)),
                          child: IconButton(
                            splashRadius: 18,
                            icon: Icon(
                              Icons.add,
                              size: 18,
                              color: context.theme.disabledColor,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Tooltip(
                          waitDuration: const Duration(milliseconds: 700),
                          message: 'Edit section',
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.9)),
                          child: IconButton(
                            splashRadius: 18,
                            icon: Icon(
                              Icons.edit_note,
                              size: 16,
                              color: _editable
                                  ? context.theme.primaryColor
                                  : context.theme.disabledColor,
                            ),
                            onPressed: () {
                              _controller = context.read<KanbanController>();
                              _changeEditState();
                            },
                          ),
                        ),
                        Tooltip(
                          waitDuration: const Duration(milliseconds: 500),
                          message:
                              'Double tap to delete.\nAll tasks in this section will be deleted!',
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.9)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.close,
                                size: 16,
                                color: context.theme.disabledColor,
                              ),
                            ),
                            onDoubleTap: () {
                              context.read<KanbanController>().add(
                                    KanbanDeleteSectionEvent(
                                        index: widget.index),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height - 120,
                    ),
                    child: ListView.builder(
                      itemCount: _cards.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (index == 0) const ExpansibleContainer(),
                            DraggableKanbanCard(model: _cards[index]),
                            const ExpansibleContainer(),
                          ],
                        );
                      },
                    ),
                  ),
                  if (_cards.isEmpty)
                    const ExpansibleContainer(
                      expanded: true,
                      initalHeight: 60,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _titleController.dispose();
    super.dispose();
  }
}
