class TaskModel {
  final int index;
  final int sectionIndex;
  final String title;
  final String description;
  final String priority;

  TaskModel({
    required this.title,
    required this.description,
    this.index = 0,
    this.sectionIndex = 0,
    this.priority = 'low',
  });

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.sectionIndex == sectionIndex &&
        other.title == title &&
        other.description == description &&
        other.priority == priority;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        sectionIndex.hashCode ^
        title.hashCode ^
        description.hashCode ^
        priority.hashCode;
  }

  TaskModel copyWith({
    int? index,
    int? sectionIndex,
    String? title,
    String? description,
    String? priority,
  }) {
    return TaskModel(
      index: index ?? this.index,
      sectionIndex: sectionIndex ?? this.sectionIndex,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
    );
  }
}
