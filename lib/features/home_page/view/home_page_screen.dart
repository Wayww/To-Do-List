import 'package:flutter/material.dart';
import 'package:test_1/features/project_creating_page/view/project_creating_page_screen.dart';
import 'package:test_1/features/project_detail_page/view/project_detail_page_screen.dart';
// ignore: unused_import
import 'package:test_1/features/repositores/myapp_repository.dart';
import 'package:test_1/main.dart'; // Убедитесь, что путь к вашему репозиторию правильный

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  List<Project> projects = [];

  void addProject(Project project) {
    setState(() {
      projects.add(project);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        centerTitle: true,
      ),
      body: projects.isEmpty
          ? Center(
              child: Text(
                'You don\'t have any projects yet.\nCreate one!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )
          : ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(project.name),
                    subtitle: Text('Tasks: ${project.tasks.length}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProjectDetailPage(project: project),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectCreationPage(onCreate: addProject),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
