import 'package:flutter/material.dart';
import 'package:ingresouts/src/preferences_user/preferences_user.dart';
import 'package:ingresouts/src/screens/screens.dart';
import 'package:ingresouts/src/theme/usertheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ingreso UTS',
      initialRoute: 'splash',
      routes: {
        'home': (context) => const HomeScreen(),
        'splash': (context) => const SplashScreen(),
        'login': (context) => const LoginScreen(),
      },
      theme: UserTheme.mainTheme,
    );
  }
}