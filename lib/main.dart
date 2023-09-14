import 'package:flutter/material.dart';
import 'package:kanban/app/views/home_view.dart';
import 'package:kanban/core/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanban',
      theme: LightTheme().theme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: HomeView()),
    );
  }
}
