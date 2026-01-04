import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> tasks;

  const HomeScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(
        child: Text("No tasks yet"),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      itemBuilder: (_, index) => Card(
        child: ListTile(
          title: Text(tasks[index]),
        ),
      ),
    );
  }
}