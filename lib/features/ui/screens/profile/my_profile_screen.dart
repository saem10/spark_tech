import 'package:flutter/material.dart';

import 'edit_profile_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          SizedBox(height: 24),
          CircleAvatar(radius: 45),
          SizedBox(height: 16),
          _ProfileInfoTile(icon: Icons.person, text: 'Mojahid Islam'),
          _ProfileInfoTile(icon: Icons.email, text: 'samalman@gmail.com'),
          _ProfileInfoTile(icon: Icons.location_on, text: '1234 Elm Street'),
        ],
      ),
    );
  }
}

class _ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ProfileInfoTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(text),
    );
  }
}
