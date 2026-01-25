import 'package:spark_tech/features/ui/screens/profile/profile_home_screen.dart';
import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String name = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
     HomeScreen(),
     AddTaskScreen(),
     ProfileHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        indicatorColor: Colors.green,
        indicatorShape: const CircleBorder(),
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: 'My Tasks'),
          NavigationDestination(icon: Icon(Icons.add), label: 'Add Task'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );

  }
}
