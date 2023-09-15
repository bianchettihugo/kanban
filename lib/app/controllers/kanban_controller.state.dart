import 'package:flutter/foundation.dart';

import 'package:kanban/app/models/section_model.dart';

class KanbanState {
  final List<SectionModel> sections;
  final bool loading;
  final bool buildAll;
  final int originSectionIndex;
  final int destinySectionIndex;

  KanbanState({
    this.sections = const [],
    this.loading = true,
    this.buildAll = true,
    this.originSectionIndex = 0,
    this.destinySectionIndex = 0,
  });

  @override
  bool operator ==(covariant KanbanState other) {
    if (identical(this, other)) return true;

    return listEquals(other.sections, sections) &&
        other.loading == loading &&
        other.buildAll == buildAll &&
        other.originSectionIndex == originSectionIndex &&
        other.destinySectionIndex == destinySectionIndex;
  }

  @override
  int get hashCode {
    return sections.hashCode ^
        loading.hashCode ^
        buildAll.hashCode ^
        originSectionIndex.hashCode ^
        destinySectionIndex.hashCode;
  }

  KanbanState copyWith({
    List<SectionModel>? sections,
    bool? loading,
    bool? buildAll,
    int? originSectionIndex,
    int? destinySectionIndex,
  }) {
    return KanbanState(
      sections: sections ?? this.sections,
      loading: loading ?? this.loading,
      buildAll: buildAll ?? this.buildAll,
      originSectionIndex: originSectionIndex ?? this.originSectionIndex,
      destinySectionIndex: destinySectionIndex ?? this.destinySectionIndex,
    );
  }
}
