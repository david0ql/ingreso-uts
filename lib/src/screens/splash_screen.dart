import 'package:flutter/material.dart';
import 'package:ingresouts/src/preferences_user/preferences_user.dart';
import 'package:ingresouts/src/theme/usertheme.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      UserPreferences.correo == ""
          ? Navigator.pushReplacementNamed(context, 'login')
          : Navigator.pushReplacementNamed(context, 'home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: UserTheme.primaryColor,
      child: Center(
        child: Lottie.network(
            "https://assets6.lottiefiles.com/packages/lf20_bneaqhes.json"),
      ),
    ));
  }
}
