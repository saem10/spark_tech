import 'package:flutter/material.dart';

import '../../../models/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;

  const TaskItemWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text('${task.description}\nDate: ${task.date}'),
      trailing: const Icon(Icons.edit),
    );
  }
}

