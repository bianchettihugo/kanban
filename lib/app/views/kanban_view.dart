import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/controllers/kanban_controller.dart';
import 'package:kanban/app/models/section_model.dart';
import 'package:kanban/core/widgets/containers/kanban_container.dart';
import 'package:kanban/core/widgets/containers/new_section_container.dart';
import 'package:kanban/core/widgets/utils/drag_proxy.dart';

class KanbanView extends StatelessWidget {
  const KanbanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KanbanController, List<SectionModel>?>(
      builder: (context, sections) {
        if (sections == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ReorderableListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          buildDefaultDragHandles: false,
          scrollDirection: Axis.horizontal,
          proxyDecorator: proxyDecorator,
          onReorder: (int oldIndex, int newIndex) {
            context.read<KanbanController>().add(KanbanSectionMoveEvent(
                  oldIndex: oldIndex,
                  newIndex: newIndex,
                ));
          },
          footer: const NewSectionContainer(),
          children: [
            for (int index = 0; index < sections.length; index += 1)
              KanbanContainer(
                key: ValueKey('${sections[index].hashCode}$index'),
                index: index,
                model: sections[index],
              )
          ],
        );
      },
    );
  }
}
