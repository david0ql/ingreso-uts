import 'package:flutter/material.dart';
import 'package:ingresouts/src/preferences_user/preferences_user.dart';
import 'package:ingresouts/src/screens/screens.dart';
import 'package:ingresouts/src/services/bottom_service.dart';
import 'package:ingresouts/src/theme/usertheme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UserPreferences.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomService>(
          create: (context) => BottomService(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ingreso UTS - David',
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
