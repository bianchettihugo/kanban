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

final class KanbanNewTaskEvent extends KanbanEvent {
  final int index;

  KanbanNewTaskEvent({
    required this.index,
  });
}

final class KanbanEditTaskEvent extends KanbanEvent {
  final int sectionIndex;
  final int index;
  final String? title;
  final String? description;
  final String? priority;

  KanbanEditTaskEvent({
    required this.sectionIndex,
    required this.index,
    this.title,
    this.description,
    this.priority,
  });
}

final class KanbanDeleteTaskEvent extends KanbanEvent {
  final int sectionIndex;
  final int index;

  KanbanDeleteTaskEvent({
    required this.sectionIndex,
    required this.index,
  });
}

final class KanbanMoveTaskEvent extends KanbanEvent {
  final int originSectionIndex;
  final int destinySectionIndex;
  final int originIndex;
  final int destinyIndex;

  KanbanMoveTaskEvent({
    required this.originSectionIndex,
    required this.destinySectionIndex,
    required this.originIndex,
    required this.destinyIndex,
  });
}
