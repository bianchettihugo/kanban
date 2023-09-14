import 'package:flutter/material.dart';
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
  final _titleFocusNode = FocusNode();

  late List<TaskModel> _cards;
  bool _editable = false;

  @override
  void initState() {
    _cards = [...widget.model.tasks];
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
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
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
                        child: Container(
                          color: context.theme.canvasColor,
                          child: IgnorePointer(
                            ignoring: !_editable,
                            child: TextFormField(
                              readOnly: !_editable,
                              focusNode: _titleFocusNode,
                              decoration:
                                  const InputDecoration.collapsed(hintText: ''),
                              initialValue: widget.model.title,
                              style: context.text.bodyMedium.semibold,
                            ),
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
                  height: MediaQuery.of(context).size.height - 120,
                  child: ListView.builder(
                    itemCount: _cards.length,
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
              ],
            ),
          ),
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
