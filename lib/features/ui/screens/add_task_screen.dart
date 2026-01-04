import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String) onAddTask;
  final TextEditingController controller = TextEditingController();

  AddTaskScreen({super.key, required this.onAddTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Task name",
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                onAddTask(controller.text);
              }
            },
            child: const Text("Add Task"),
          ),
        ],
      ),
    );
  }
}