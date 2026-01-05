import 'dart:io';
import 'package:flutter/material.dart';
import '../../../features/task/data/models/task_model.dart';
import '../../../features/task/data/services/task_api_service.dart';
import '../../widgets/task_item_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.profileImage});
  final File? profileImage;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<TaskModel>> _tasksFuture;
  final TaskApiService _taskService = TaskApiService();

  @override
  void initState() {
    super.initState();
    _tasksFuture = _taskService.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: widget.profileImage != null
                  ? FileImage(widget.profileImage!)
                  : null,
              child: widget.profileImage == null
                  ? const Icon(Icons.person)
                  : null,
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Saem Hasan', style: TextStyle(fontSize: 16)),
                  Text('saem5091@gmail.com', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<TaskModel>>(
        future: _tasksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
              ),
            );
          }

          final tasks = snapshot.data ?? [];

          if (tasks.isEmpty) {
            return const Center(
              child: Text(
                'No tasks found',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskItemWidget(
                title: task.title,
                description: task.description,
                onDelete: () async {
                  try {
                    await _taskService.deleteTask(task.id);
                    setState(() {
                      _tasksFuture = _taskService.getAllTasks();
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}