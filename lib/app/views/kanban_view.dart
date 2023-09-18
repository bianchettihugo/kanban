import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/controllers/kanban_controller.dart';
import 'package:kanban/app/controllers/kanban_controller.event.dart';
import 'package:kanban/app/controllers/kanban_controller.state.dart';
import 'package:kanban/core/widgets/containers/kanban_container.dart';
import 'package:kanban/core/widgets/containers/new_section_container.dart';
import 'package:kanban/core/widgets/utils/drag_proxy.dart';

class KanbanView extends StatefulWidget {
  const KanbanView({super.key});

  @override
  State<KanbanView> createState() => _KanbanViewState();
}

class _KanbanViewState extends State<KanbanView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KanbanController, KanbanState>(
      buildWhen: (previous, current) => current.buildAll,
      builder: (context, state) {
        if (state.loading) {
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
            for (int index = 0; index < state.sections.length; index += 1)
              BlocBuilder<KanbanController, KanbanState>(
                  key: ValueKey('${state.sections[index].hashCode}$index'),
                  buildWhen: (previous, current) {
                    return !current.buildAll &&
                            current.originSectionIndex == index ||
                        current.destinySectionIndex == index;
                  },
                  bloc: context.read<KanbanController>(),
                  builder: (context, state) {
                    return KanbanContainer(
                      key: ValueKey('${state.sections[index].hashCode}$index'),
                      index: index,
                      model: state.sections[index],
                    );
                  })
          ],
        );
      },
    );
  }
}
