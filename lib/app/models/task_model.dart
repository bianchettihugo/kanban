class TaskModel {
  final int index;
  final String title;
  final String description;
  final String priority;

  TaskModel({
    required this.title,
    required this.description,
    this.index = 0,
    this.priority = 'low',
  });

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.title == title &&
        other.description == description &&
        other.priority == priority;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        title.hashCode ^
        description.hashCode ^
        priority.hashCode;
  }
}
