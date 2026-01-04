import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'widgets/custom_bottom_nav.dart';

class MainNavBarScreen extends StatefulWidget {
  const MainNavBarScreen({super.key});
  static const String name ='Main-navigation-bar';

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

class _MainNavBarScreenState extends State<MainNavBarScreen> {
  int currentIndex = 0;
  final List<String> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
      currentIndex = 0; // Go back to My Tasks
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(tasks: tasks),
      AddTaskScreen(onAddTask: addTask),
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/profile.png"),
            ),
            const SizedBox(width: 10),
            const Text(
              "Mir Saem Hasan",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}
