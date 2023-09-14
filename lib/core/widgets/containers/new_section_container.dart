import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/controllers/kanban_controller.dart';
import 'package:kanban/core/utils/extensions.dart';

class NewSectionContainer extends StatelessWidget {
  const NewSectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: () {
          context.read<KanbanController>().add(KanbanNewSectionEvent());
        },
        splashFactory: NoSplash.splashFactory,
        focusColor: context.theme.colorScheme.background,
        hoverColor: context.theme.colorScheme.background,
        highlightColor: context.theme.colorScheme.background,
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            color: context.theme.canvasColor,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(right: 30),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add new section',
                style: context.text.bodyMedium.semibold,
              ),
              const Spacer(),
              Icon(
                Icons.add,
                size: 18,
                color: context.theme.disabledColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
