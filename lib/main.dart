import 'package:flutter/material.dart';
import 'package:test_1/myapp_app.dart';

void main() {
  runApp(const MyApp());
}

class Project {
  String name;
  List<String> tasks;
  List<bool> taskCompletion;

  Project({
    required this.name,
    required this.tasks,
  }) : taskCompletion = List.generate(tasks.length, (index) => false);

  static fromJson(json) {}
}
