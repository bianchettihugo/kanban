import 'package:flutter/material.dart';
import 'package:kanban/core/widgets/dismissible_area.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DismissibleArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text('SETTINGS'),
        ],
      ),
    );
  }
}
