import 'package:flutter/material.dart';
import 'package:spark_tech/features/ui/screens/log_in_screen.dart';
import 'sign_up_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  static const String name = 'Set-password-screen';

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  bool rememberMe = false;
  bool obscurePassword = true;

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
              Text("Set Your New Password",
                  style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                "Create a secure password to protected your account and get started seamlessly!",
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: 32),

              /// Email
              const Text(
                "New Password",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Password
              const Text(
                "New Confirm Password",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.name);
                },
                child: Text('Continue'),),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
