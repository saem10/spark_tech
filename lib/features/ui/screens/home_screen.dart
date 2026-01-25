import 'package:flutter/material.dart';
import 'package:spark_tech/features/ui/screens/log_in_screen.dart';
import '../../controllers/task_controller.dart';
import '../../models/task_model.dart';
import 'widgets/task_item_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() {
    tasks = TaskController.getTasks();
    setState(() {});
  }




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
                Text(
                  'saem5091@gmail.com',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.name,
                    (route) => false,
              );
            },
          ),
        ],

      ),
        body: tasks.isEmpty
            ? const Center(child: Text('No tasks yet'))
            : ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskItemWidget(task: tasks[index]);
          },
        ),
    );
  }
}