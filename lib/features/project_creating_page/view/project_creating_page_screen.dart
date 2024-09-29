import 'package:flutter/material.dart';
import 'package:test_1/main.dart';

class ProjectCreationPage extends StatefulWidget {
  final void Function(Project) onCreate;

  const ProjectCreationPage({super.key, required this.onCreate});

  @override
  _ProjectCreationPageState createState() => _ProjectCreationPageState();
}

class _ProjectCreationPageState extends State<ProjectCreationPage> {
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  final List<String> _tasks = [];

  void addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(_taskController.text);
        _taskController.clear();
      });
    }
  }

  void createProject() {
    if (_projectNameController.text.isNotEmpty && _tasks.isNotEmpty) {
      final project = Project(
        name: _projectNameController.text,
        tasks: _tasks,
      );
      widget.onCreate(project);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Project'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _projectNameController,
              decoration: const InputDecoration(
                labelText: 'Project Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                labelText: 'Task',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => addTask(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addTask,
              child: const Text('Add Task'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_tasks[index]),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: createProject,
              child: const Text('Create Project'),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
            ),
          ],
        ),
      ),
    );
  }
}
