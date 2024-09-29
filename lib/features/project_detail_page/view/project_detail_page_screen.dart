import 'package:flutter/material.dart';
import 'package:test_1/main.dart';

class ProjectDetailPage extends StatefulWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.name),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.project.tasks.length,
        itemBuilder: (context, index) {
          final task = widget.project.tasks[index];
          final isCompleted = widget.project.taskCompletion[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                task,
                style: TextStyle(
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Checkbox(
                value: isCompleted,
                onChanged: (bool? value) {
                  setState(() {
                    widget.project.taskCompletion[index] = value ?? false;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
