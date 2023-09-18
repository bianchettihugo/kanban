import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/controllers/kanban_controller.dart';
import 'package:kanban/app/controllers/kanban_controller.event.dart';
import 'package:kanban/app/models/task_model.dart';

class ExpansibleContainer extends StatefulWidget {
  final bool expanded;
  final double? initalHeight;
  final int sectionIndex;
  final int index;

  const ExpansibleContainer({
    this.expanded = false,
    this.initalHeight,
    this.sectionIndex = 0,
    this.index = 0,
    super.key,
  });

  @override
  State<ExpansibleContainer> createState() => _ExpansibleContainerState();
}

class _ExpansibleContainerState extends State<ExpansibleContainer> {
  late double _height;

  @override
  void initState() {
    _height = widget.expanded ? (widget.initalHeight ?? 230) : 25;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<TaskModel>(
      onWillAccept: (data) {
        setState(() {
          _height = 230;
        });
        return true;
      },
      onAccept: (data) {
        context.read<KanbanController>().add(
              KanbanMoveTaskEvent(
                originIndex: data.index,
                originSectionIndex: data.sectionIndex,
                destinyIndex: widget.index,
                destinySectionIndex: widget.sectionIndex,
              ),
            );
        setState(() {
          _height = widget.initalHeight ?? 25;
        });
      },
      onLeave: (data) {
        setState(() {
          _height = widget.initalHeight ?? 25;
        });
      },
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          height: _height,
          duration: const Duration(milliseconds: 120),
        );
      },
    );
  }
}
