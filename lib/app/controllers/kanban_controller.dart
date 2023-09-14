import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/models/section_model.dart';

sealed class KanbanEvent {}

final class KanbanLoadDataEvent extends KanbanEvent {}

final class KanbanSectionMoveEvent extends KanbanEvent {
  final int oldIndex;
  final int newIndex;

  KanbanSectionMoveEvent({required this.oldIndex, required this.newIndex});
}

final class KanbanNewSectionEvent extends KanbanEvent {}

class KanbanController extends Bloc<KanbanEvent, List<SectionModel>?> {
  KanbanController() : super(null) {
    on<KanbanLoadDataEvent>(_loadData);
    on<KanbanNewSectionEvent>(_newSection);
    on<KanbanSectionMoveEvent>(_moveSection);
  }

  Future<void> _loadData(
      KanbanLoadDataEvent event, Emitter<List<SectionModel>?> emit) async {
    await Future.delayed(const Duration(seconds: 1));

    emit([
      SectionModel(title: 'To Do'),
      SectionModel(title: 'In Progress'),
      SectionModel(title: 'Done'),
    ]);
  }

  void _moveSection(
      KanbanSectionMoveEvent event, Emitter<List<SectionModel>?> emit) {
    int oldIndex = event.oldIndex;
    int newIndex = event.newIndex;

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final item = state!.removeAt(oldIndex);
    state!.insert(newIndex, item);

    emit([...state!]);
  }

  void _newSection(
      KanbanNewSectionEvent event, Emitter<List<SectionModel>?> emit) {
    state!.add(SectionModel(title: 'Section'));
    emit([...state!]);
  }
}
