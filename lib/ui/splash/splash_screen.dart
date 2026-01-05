import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spark_tech/app/assets_path.dart';
import '../../../core/network/token_storage.dart';
import '../screens/auth/log_in_screen.dart';
import '../widgets/main_nav_bar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await TokenStorage.loadToken();
    await Future.delayed(const Duration(seconds: 2));

    if (TokenStorage.token != null) {
      Navigator.pushReplacementNamed(context, MainNavBarScreen.name);
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.name);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
              AssetsPath.logoSvg,
              width: 240,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}