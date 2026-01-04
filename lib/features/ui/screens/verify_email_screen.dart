import 'package:flutter/material.dart';
import 'package:spark_tech/features/ui/screens/otp_screen.dart';
import 'sign_up_screen.dart';


class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  static const String name = 'log-in';

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text("Verify Your Email", style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                "We'll send a verification code on your email to confirm your account. ",
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: 32),

              /// Email
              const Text(
                "Email Address",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "saem@example.com",
                ),
              ),
              const SizedBox(height: 64),


              ///Send Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, OtpScreen.name);
                },
                child: Text('Send OTP'),),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
