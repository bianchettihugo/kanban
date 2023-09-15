import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/controllers/kanban_controller.event.dart';
import 'package:kanban/app/controllers/kanban_controller.state.dart';
import 'package:kanban/app/models/section_model.dart';

class KanbanController extends Bloc<KanbanEvent, KanbanState> {
  KanbanController() : super(KanbanState()) {
    on<KanbanLoadDataEvent>(_loadData);
    on<KanbanNewSectionEvent>(_newSection);
    on<KanbanSectionMoveEvent>(_moveSection);
    on<KanbanDeleteSectionEvent>(_deleteSection);
    on<KanbanEditSectionEvent>(_editSection);
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
}
