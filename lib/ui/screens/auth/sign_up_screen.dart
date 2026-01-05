import 'package:flutter/material.dart';
import '../../../features/auth/data/services/auth_api_service.dart';
import 'log_in_screen.dart';
import 'otp_screen.dart';
import 'verify_email_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;
  bool obscurePassword = true;
  bool isLoading = false;

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
                const Text(
                  'Join Task Manager today -- organize better, work smarter, and stay in control of your day',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 16),

                /// First Name
                const Text('First Name',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: "Saem"),
                ),
                const SizedBox(height: 16),

                /// Last Name
                const Text('Last Name',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: "Hasan"),
                ),
                const SizedBox(height: 16),

                /// Email
                const Text('Email Address',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration:
                  const InputDecoration(hintText: "saem@example.com"),
                ),
                const SizedBox(height: 16),

                /// Address
                const Text('Address',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _addressTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "Noakhali, Bangladesh",
                  ),
                ),
                const SizedBox(height: 16),

                /// Password
                const Text('Password',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Confirm Password
                const Text('Confirm Password',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _cpasswordTEController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                /// Terms
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
                    const Expanded(
                      child: Text(
                          "I agree to the Terms & Condition and Privacy Policy"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                /// Login link
                Row(
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
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                /// Continue Button (API INTEGRATED)
                SizedBox(
                  width: double.infinity,
                  height: 48, // IMPORTANT
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _onContinuePressed,
                    child: isLoading
                        ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                        : const Text('Continue'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onContinuePressed() async {
    setState(() => isLoading = true);

    // allow UI to rebuild
    await Future.delayed(const Duration(milliseconds: 100));

    try {
      await AuthApiService.register(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
        address: _addressTEController.text.trim(),
      );

      Navigator.pushNamed(
        context,
        OtpScreen.name,
        arguments: _emailTEController.text.trim(),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
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
