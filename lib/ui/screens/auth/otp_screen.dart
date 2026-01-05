import 'dart:convert';
import '../../../../core/network/api_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../features/auth/data/services/auth_api_service.dart';
import 'log_in_screen.dart';

class OtpScreen extends StatelessWidget {
  static const String name = '/otp';
  final TextEditingController otpController = TextEditingController();

  OtpScreen({super.key});

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
            Text('Verify OTP for $email'),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'OTP'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await AuthApiService.verifyOtp(
                    email: email,
                    otp: otpController.text.trim(),
                  );

                  Navigator.pushReplacementNamed(
                      context, LoginScreen.name);
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: const Text('Verify'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  static Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await http.post(
      Uri.parse(ApiConfig.verifyOtp),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'code': otp,
      }),
    );

    final body = jsonDecode(response.body);
    debugPrint('VERIFY OTP RESPONSE: $body');

    if (response.statusCode != 200 || body['status'] != 'Success') {
      throw Exception(body['message'] ?? 'OTP verification failed');
    }
  }


}
