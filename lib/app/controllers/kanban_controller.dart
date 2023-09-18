import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/controllers/kanban_controller.event.dart';
import 'package:kanban/app/controllers/kanban_controller.state.dart';
import 'package:kanban/app/models/section_model.dart';
import 'package:kanban/app/models/task_model.dart';

class KanbanController extends Bloc<KanbanEvent, KanbanState> {
  KanbanController() : super(KanbanState()) {
    on<KanbanLoadDataEvent>(_loadData);
    on<KanbanNewSectionEvent>(_newSection);
    on<KanbanSectionMoveEvent>(_moveSection);
    on<KanbanDeleteSectionEvent>(_deleteSection);
    on<KanbanEditSectionEvent>(_editSection);
    on<KanbanNewTaskEvent>(_newTask);
    on<KanbanEditTaskEvent>(_editTask);
    on<KanbanDeleteTaskEvent>(_deleteTask);
    on<KanbanMoveTaskEvent>(_moveTask);
  }

  Future<void> _loadData(
      KanbanLoadDataEvent event, Emitter<KanbanState> emit) async {
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      sections: [
        SectionModel(title: 'To Do'),
        SectionModel(title: 'In Progress'),
        SectionModel(title: 'Done'),
      ],
      loading: false,
      buildAll: true,
    ));
  }

  void _moveSection(KanbanSectionMoveEvent event, Emitter<KanbanState> emit) {
    int oldIndex = event.oldIndex;
    int newIndex = event.newIndex;

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final list = [...state.sections];
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);

    emit(state.copyWith(
      sections: list,
      buildAll: true,
    ));
  }

  void _newSection(KanbanNewSectionEvent event, Emitter<KanbanState> emit) {
    emit(state.copyWith(
      sections: [...state.sections, SectionModel(title: 'Section')],
      buildAll: true,
    ));
  }

  void _deleteSection(
      KanbanDeleteSectionEvent event, Emitter<KanbanState> emit) {
    final list = [...state.sections];
    list.removeAt(event.index);
    emit(state.copyWith(sections: list, buildAll: true));
  }

  FutureOr<void> _editSection(
      KanbanEditSectionEvent event, Emitter<KanbanState> emit) {
    final element = state.sections.elementAt(event.index);
    final list = [...state.sections];
    list[event.index] = element.copyWith(title: event.newTitle);
    emit(state.copyWith(
      sections: list,
      buildAll: false,
      originSectionIndex: -1,
      destinySectionIndex: event.index,
    ));
  }

  FutureOr<void> _newTask(KanbanNewTaskEvent event, Emitter<KanbanState> emit) {
    final list = [...state.sections];
    final element = list.elementAt(event.index);
    list[event.index] = element.copyWith(tasks: [
      ...element.tasks,
      TaskModel(
        title: 'New Task',
        description: '',
      ),
    ]);
    emit(state.copyWith(
      sections: list,
      buildAll: false,
      originSectionIndex: -1,
      destinySectionIndex: event.index,
    ));
  }

  FutureOr<void> _editTask(
      KanbanEditTaskEvent event, Emitter<KanbanState> emit) {
    final task = state.sections[event.sectionIndex].tasks[event.index];
    state.sections[event.sectionIndex].tasks[event.index] = task.copyWith(
      title: event.title,
      description: event.description,
      priority: event.priority,
    );
  }

  FutureOr<void> _deleteTask(
      KanbanDeleteTaskEvent event, Emitter<KanbanState> emit) {
    final list = [...state.sections];
    list[event.sectionIndex].tasks.removeAt(event.index);

    emit(state.copyWith(
      sections: list,
      buildAll: false,
      originSectionIndex: state.originSectionIndex == -1 ? -2 : -1,
      destinySectionIndex: event.sectionIndex,
    ));
  }

  FutureOr<void> _moveTask(
      KanbanMoveTaskEvent event, Emitter<KanbanState> emit) {
    var list = [...state.sections];
    var tasksOrigin = [...list[event.originSectionIndex].tasks];
    var tasksDestiny = event.originSectionIndex == event.destinySectionIndex
        ? tasksOrigin
        : [...list[event.destinySectionIndex].tasks];

    final item = tasksOrigin.removeAt(event.originIndex);
    if (event.originSectionIndex == event.destinySectionIndex &&
        event.destinyIndex == tasksDestiny.length + 1) {
      tasksDestiny.insert(event.destinyIndex - 1, item);
    } else {
      tasksDestiny.insert(event.destinyIndex, item);
    }

    list[event.originSectionIndex] =
        list[event.originSectionIndex].copyWith(tasks: tasksOrigin);

    list[event.destinySectionIndex] =
        list[event.destinySectionIndex].copyWith(tasks: tasksDestiny);

    emit(state.copyWith(
      sections: list,
      buildAll: false,
      originSectionIndex: event.originSectionIndex,
      destinySectionIndex: event.destinySectionIndex,
    ));
  }
}
