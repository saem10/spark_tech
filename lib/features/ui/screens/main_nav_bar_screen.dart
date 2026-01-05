import 'dart:io';
import 'package:flutter/material.dart';
import 'package:spark_tech/features/ui/screens/add_task_screen.dart';
import 'package:spark_tech/features/ui/screens/home_screen.dart';
import 'package:spark_tech/features/ui/screens/profile/profile_home_screen.dart';

class MainNavBarScreen extends StatefulWidget {
  const MainNavBarScreen({super.key});

  static const String name = '/home';

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

class _MainNavBarScreenState extends State<MainNavBarScreen> {
  int _selectedIndex = 0;

  // Shared profile image state
  File? _profileImage;

  // Called from Profile screen
  void _updateProfileImage(File image) {
    setState(() {
      _profileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    switch (_selectedIndex) {
      case 0:
        currentScreen = HomeScreen(profileImage: _profileImage);
        break;

      case 1:
        currentScreen = const AddTaskScreen();
        break;

      case 2:
        currentScreen = ProfileHomeScreen(
          profileImage: _profileImage,
          onProfileImageUpdated: _updateProfileImage,
        );
        break;

      default:
        currentScreen = const SizedBox();
    }

    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        indicatorColor: Colors.green,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'My Tasks',
          ),
          NavigationDestination(icon: Icon(Icons.add), label: 'Add Task'),
          NavigationDestination(icon: Icon(Icons.person_pin), label: 'Profile'),
        ],
      ),
    );
  }
}
