import 'package:flutter/material.dart';
import '../screens/profile/profile_home_screen.dart';
import '../screens/task/add_task_screen.dart';
import '../screens/task/home_screen.dart';


class MainNavBarScreen extends StatefulWidget {
  const MainNavBarScreen({super.key});
  static const String name= '/home';

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

class _MainNavBarScreenState extends State<MainNavBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens= [

    HomeScreen(),
    AddTaskScreen(),
    ProfileHomeScreen(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          indicatorColor: Colors.green,
          onDestinationSelected: (int index){
            _selectedIndex = index;
            setState(() {});
          },
          destinations:[
            NavigationDestination(icon: Icon(Icons.home_outlined), label:'My Tasks'),
            NavigationDestination(icon: Icon(Icons.add), label:'Add Task'),
            NavigationDestination(icon: Icon(Icons.person_pin), label:'Profile'),
          ]
      ),
    );
  }
}