import 'package:flutter/material.dart';
import '../ui/screens/auth/log_in_screen.dart';
import '../ui/screens/auth/otp_screen.dart';
import '../ui/screens/auth/set_password_screen.dart';
import '../ui/screens/auth/sign_up_screen.dart';
import '../ui/screens/auth/verify_email_screen.dart';
import '../ui/splash/splash_screen.dart';
import '../ui/widgets/main_nav_bar_screen.dart';


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
      route = OtpScreen();
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