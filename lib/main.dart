import 'package:flutter/material.dart';
import 'package:ingresouts/src/auth/auth_config.dart';
import 'package:ingresouts/src/routes/routes.dart';
import 'package:ingresouts/src/services/bottom_service.dart';
import 'package:ingresouts/src/theme/usertheme.dart';
import 'package:provider/provider.dart';

void main() {
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
      navigatorKey: AuthAzure.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Ingreso UTS',
      initialRoute: 'splash',
      routes: MyRoutes.routes,
      theme: UserTheme.mainTheme,
    );
  }
}
