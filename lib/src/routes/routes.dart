import 'package:flutter/material.dart';

import '../screens/screens.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (context) => const HomeScreen(),
    'splash': (context) => const SplashScreen(),
    'login': (context) => const LoginScreen(),
  };
}
