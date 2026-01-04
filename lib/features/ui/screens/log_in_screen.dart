import 'package:flutter/material.dart';
import 'package:spark_tech/features/ui/screens/main_nav_bar_screen.dart';
import 'sign_up_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String name = 'Verify-email';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Text("Welcome Back!", style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                "Stay productive and take control of your tasks.",
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

              const SizedBox(height: 20),

              /// Password
              const Text(
                "Password",
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

              const SizedBox(height: 12),

              /// Remember Me
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  const Text("Remember me"),
                ],
              ),

              const SizedBox(height: 24),

              /// OR Divider
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1,color: Colors.black,)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("OR",style: TextStyle(color: Colors.black,),),
                  ),
                  Expanded(child: Divider(thickness: 1,color: Colors.black,)),
                ],
              ),

              const SizedBox(height: 20),

              /// Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Don’t have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.name);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MainNavBarScreen.name);
                },
                child: Text('Log In'),),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
