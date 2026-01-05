import 'package:flutter/material.dart';

import 'change_password_screen.dart';
import 'profile_option_tile.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Setting')),
      body: Column(
        children: [
          ProfileOptionTile(
            icon: Icons.lock,
            title: 'Change Password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChangePasswordScreen(),
                ),
              );
            },
          ),
          ProfileOptionTile(
            icon: Icons.delete,
            title: 'Delete Account',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
