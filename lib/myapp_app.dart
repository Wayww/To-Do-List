import 'package:flutter/material.dart';
import 'package:test_1/features/home_page/view/home_page_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProjectListPage(),
    );
  }
}
