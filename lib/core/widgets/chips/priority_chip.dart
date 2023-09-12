import 'package:flutter/material.dart';
import 'package:kanban/core/widgets/chips/priority.dart';
import 'package:kanban/core/themes/base_theme.dart';
import 'package:kanban/core/utils/extensions.dart';

class PriorityChip extends StatelessWidget {
  final Priority priority;

  PriorityChip({
    this.priority = Priority.low,
    super.key,
  });

  final _color = {
    Priority.low: BaseTheme.colors.blue,
    Priority.medium: BaseTheme.colors.yellow,
    Priority.hight: BaseTheme.colors.red,
  };

  final _text = {
    Priority.low: 'Low Priority',
    Priority.medium: 'Medium Priority',
    Priority.hight: 'Hight Priority',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: _color[priority]!.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        _text[priority]!,
        style: context.text.labelMedium!.copyWith(
          color: _color[priority],
        ),
      ),
    );
  }
}
