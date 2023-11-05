import 'package:flutter/material.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/ui/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (_)=> const HomeScreen(),
        SplashScreen.routeName : (_)=>const SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
      home: const HomeScreen(),
    );
  }
}
