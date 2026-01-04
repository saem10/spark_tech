import 'package:flutter/material.dart';
import 'widgets/task_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tasks = ['Task 1', 'Task 2', 'Task 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            const CircleAvatar(),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Saem Hasan', style: TextStyle(fontSize: 16)),
                Text('saem5091@gmail.com', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
      body: buildTaskListView(),
    );
  }

  Widget buildTaskListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItemWidget(title: tasks[index]);
      },
    );
  }
}
