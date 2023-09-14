import 'package:flutter/foundation.dart';

import 'package:kanban/app/models/task_model.dart';

class SectionModel {
  final String title;
  final List<TaskModel> tasks;

  SectionModel({
    required this.title,
    this.tasks = const [],
  });

  @override
  bool operator ==(covariant SectionModel other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => title.hashCode ^ tasks.hashCode;
}
