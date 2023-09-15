sealed class KanbanEvent {}

final class KanbanLoadDataEvent extends KanbanEvent {}

final class KanbanSectionMoveEvent extends KanbanEvent {
  final int oldIndex;
  final int newIndex;

  KanbanSectionMoveEvent({required this.oldIndex, required this.newIndex});
}

final class KanbanNewSectionEvent extends KanbanEvent {}

final class KanbanDeleteSectionEvent extends KanbanEvent {
  final int index;

  KanbanDeleteSectionEvent({required this.index});
}

final class KanbanEditSectionEvent extends KanbanEvent {
  final int index;
  final String newTitle;

  KanbanEditSectionEvent({
    required this.index,
    required this.newTitle,
  });
}
