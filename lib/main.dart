import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/screens/auth_ui/create_account/create_account_screen.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_screen.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/ui/screens/splash_screen/splash_screen.dart';
import 'package:health360/utils/settings_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // خخخخخخخخخخخخخخخخخخخخخخخخخخ why
 // await Firebase.initializeApp();
  await _initFirebase();

  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(), child: const MyApp()));
}

Future<void> _initFirebase() async {
  final options = DefaultFirebaseOptions.currentPlatform;
// احا بتعمل هوت ريستارت منين
  //هوت ريستارت مش هوت ريلود يا علق
try{
  final app=  await Firebase.initializeApp(options: options);
  debugPrint(app.name);
}catch(e){
  print(e);
}
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
