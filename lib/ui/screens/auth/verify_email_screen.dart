import 'package:flutter/material.dart';
import 'otp_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  static const String name = '/verify-email';

  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email =
    ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),

            Text(
              email,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // OTP is ALREADY sent by backend during registration
                Navigator.pushNamed(
                  context,
                  OtpScreen.name,
                  arguments: email,
                );
              },
              child: const Text('Send OTP'),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
