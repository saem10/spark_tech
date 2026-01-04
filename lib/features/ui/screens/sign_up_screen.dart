import 'package:flutter/material.dart';
import 'package:spark_tech/features/ui/screens/verify_email_screen.dart';

import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;
  bool obscurePassword = true;

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _cpasswordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text('Create Your Account', style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  'Join Task Manager today -- organize better, work smarter, and stay in control of your day',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 16),

                ///First Name
                const Text(
                  'First Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Saem"),
                ),
                const SizedBox(height: 16),

                ///Last Name
                const Text(
                  'Last Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Hasan"),
                ),
                const SizedBox(height: 16),

                ///Email Address
                const Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: "saem@example.com"),
                ),
                const SizedBox(height: 16),

                /// Address
                const Text(
                  'Address',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _addressTEController,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Noakhali, Bangladesh",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                ///Password
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                ///Confirm Password
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _cpasswordTEController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 4),

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
                    const Text(
                      "I agree to the Terms & Condition and Privacy Policy",
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                /// OR Divider
                Row(
                  children: const [
                    Expanded(child: Divider(thickness: 1, color: Colors.black)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("OR", style: TextStyle(color: Colors.black)),
                    ),
                    Expanded(child: Divider(thickness: 1, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 20),

                ///long in
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.name);
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                ///continue Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, VerifyEmailScreen.name);
                  },
                  child: Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _addressTEController.dispose();
    _passwordTEController.dispose();
    _cpasswordTEController.dispose();
    super.dispose();
  }
}
