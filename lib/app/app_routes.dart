import 'package:flutter/material.dart';
import 'package:spark_tech/features/ui/screens/log_in_screen.dart';
import 'package:spark_tech/features/ui/screens/main_nav_bar_screen.dart';
import 'package:spark_tech/features/ui/screens/otp_screen.dart';
import 'package:spark_tech/features/ui/screens/set_password_screen.dart';
import 'package:spark_tech/features/ui/screens/verify_email_screen.dart';
import '../features/ui/screens/sign_up_screen.dart';
import '../features/ui/screens/splash_screen.dart';

class AppRoutes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    late Widget route;

    if(settings.name == SplashScreen.name) {
      route = const SplashScreen();
    } else if(settings.name == LoginScreen.name){
      route = const LoginScreen();
    } else if(settings.name == SignUpScreen.name){
      route = const SignUpScreen();
    } else if(settings.name == VerifyEmailScreen.name){
      route = const VerifyEmailScreen();
    } else if(settings.name == OtpScreen.name) {
      route = const OtpScreen();
    } else if(settings.name == SetPasswordScreen.name){
      route = const SetPasswordScreen();
    } else if (settings.name == MainNavBarScreen.name){
      route = MainNavBarScreen();
    }


    return MaterialPageRoute(builder: (context){
      return route;
    });
  }
}