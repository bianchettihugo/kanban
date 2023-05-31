import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban/app/views/analytics_view.dart';
import 'package:kanban/app/views/app_view.dart';
import 'package:kanban/app/views/kanban_view.dart';
import 'package:kanban/app/views/settings_view.dart';
import 'package:kanban/core/utils/routes.dart';
import 'package:kanban/core/utils/themes.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Kanban',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      routerConfig: GoRouter(
        initialLocation: '/board',
        routes: [
          ShellRoute(
            builder: (_, __, Widget child) {
              return AppView(child: child);
            },
            routes: <RouteBase>[
              GoRoute(
                path: Routes.board,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: KanbanView()),
              ),
              GoRoute(
                path: Routes.analytics,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: AnalyticsView()),
              ),
              GoRoute(
                path: Routes.settings,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingsView()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
