import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spark_tech/features/ui/screens/set_password_screen.dart';



class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  static const String name = 'OTP-screen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextEditingController _otpTEController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text("6 - digit code", style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                "Please enter the code we sent to your email. ",
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: 32),

              /// Email
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpTEController,
                appContext: context,
              ),
              const SizedBox(height: 64),


              ///Send Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SetPasswordScreen.name);
                },
                child: Text('Confirm'),),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
