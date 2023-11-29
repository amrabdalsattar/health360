import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health360/ui/screens/auth_ui/create_account/create_account_screen.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_screen.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/ui/screens/splash_screen/splash_screen.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) =>
      SettingsProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
        SignInScreen.routeName: (_) => SignInScreen(),
        CreateAccountScreen.routeName: (_) => const CreateAccountScreen(),
      },
      initialRoute: SplashScreen.routeName,
      home: const HomeScreen(),
    );
  }
}
