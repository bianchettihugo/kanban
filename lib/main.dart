import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanban/app/views/kanban_view.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Kanban',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
        disabledColor: const Color(0xffC7C7CD),
      ),
      home: const KanbanView(),
    );
  }
}
