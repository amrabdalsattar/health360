import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/screens/auth_ui/create_account/create_account_screen.dart';
import 'package:health360/ui/screens/auth_ui/forgot_password.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_screen.dart';
import 'package:health360/ui/screens/body_composition_screen/body_composition_screen.dart';
import 'package:health360/ui/screens/body_composition_screen/result/body_result.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var provider = SettingsProvider();
  await provider.loadConfig();

  await _initFirebase();
  runApp(ChangeNotifierProvider(create: (_) => provider,
      child: const MyApp()));
}

Future<void> _initFirebase() async {
  final options = DefaultFirebaseOptions.currentPlatform;

  try {
    final app = await Firebase.initializeApp(options: options);
    FirebaseFirestore.instance.settings =
        const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    debugPrint(app.name);
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);

    return MaterialApp(
      theme: provider.appMode,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SignInScreen.routeName: (_) => const SignInScreen(),
        CreateAccountScreen.routeName: (_) => const CreateAccountScreen(),
        ResetPasswordScreen.routeName: (_) => const ResetPasswordScreen(),
        BodyCompositionScreen.routeName: (_) => const BodyCompositionScreen(),
        BodyResult.routeName: (_) => BodyResult(),
      },
      initialRoute: SignInScreen.routeName,
      home: const HomeScreen(),
    );
  }
}
