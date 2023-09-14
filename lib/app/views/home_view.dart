import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/app/controllers/kanban_controller.dart';
import 'package:kanban/app/views/kanban_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KanbanController()..add(KanbanLoadDataEvent()),
      child: const KanbanView(),
    );
  }
}
