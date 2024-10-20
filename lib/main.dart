import 'package:flutter/material.dart';
import 'package:test_1/myapp_app.dart';

void main() {
  runApp(const MyApp());

  // Здесь создаем экземпляр проекта
  final project = Project(
    name: 'New Project', // Пример названия проекта
    tasks: ['Task 1', 'Task 2'], // Пример задач
    taskCompletion: [false, false], // Список статусов завершённости задач
  );
}

// Класс Project
class Project {
  final String name;
  final List<String> tasks;
  final List<bool> taskCompletion;

  Project({
    required this.name,
    required this.tasks,
    required this.taskCompletion,
  });

  // Метод для создания объекта Project из JSON
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      tasks: List<String>.from(json['tasks']),
      taskCompletion: List<bool>.from(json['taskCompletion']),
    );
  }

  // Метод для преобразования объекта Project в JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'tasks': tasks,
      'taskCompletion': taskCompletion,
    };
  }
}
