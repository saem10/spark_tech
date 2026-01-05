import 'package:flutter/material.dart';
import 'account_setting_screen.dart';
import 'my_profile_screen.dart';
import 'profile_option_tile.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildSection(
              title: 'Profile',
              children: [
                ProfileOptionTile(
                  icon: Icons.person,
                  title: 'My Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MyProfileScreen(),
                      ),
                    );
                  },
                ),
                ProfileOptionTile(
                  icon: Icons.settings,
                  title: 'Account Setting',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AccountSettingScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            _buildSection(
              title: 'More',
              children: [
                ProfileOptionTile(icon: Icons.description, title: 'Terms & Condition'),
                ProfileOptionTile(icon: Icons.privacy_tip, title: 'Privacy Policy'),
                ProfileOptionTile(icon: Icons.help, title: 'Help / Support'),
                ProfileOptionTile(icon: Icons.logout, title: 'Log Out'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 45),
          SizedBox(height: 8),
          Text('Mojahid', style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}