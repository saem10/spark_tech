import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _passwordField('Type Password'),
            _passwordField('New Password'),
            _passwordField('Confirm Password'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _passwordField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
