import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/ui/screens/auth_ui/create_account/create_account_screen.dart';
import 'package:health360/ui/screens/auth_ui/forgot_password.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_screen.dart';
import 'package:health360/ui/screens/body_composition_screen/body_composition_screen.dart';
import 'package:health360/ui/screens/body_composition_screen/result/body_result.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/utils/app_theme.dart';
import 'package:health360/utils/cache_helper.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  CacheData.cacheInitialization();
  await _initFirebase();
  var provider = SettingsProvider();
  await provider.loadConfig();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: ChangeNotifierProvider(
          create: (_) => provider,
          child: const MyApp())));
}

Future<void> _initFirebase() async {
  final options = DefaultFirebaseOptions.currentPlatform;

  try {
    final app = await Firebase.initializeApp(options: options);
    FirebaseFirestore.instance.settings =
        const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    debugPrint(app.name);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: provider.appMode,
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          SignInScreen.routeName: (_) => const SignInScreen(),
          CreateAccountScreen.routeName: (_) => const CreateAccountScreen(),
          ResetPasswordScreen.routeName: (_) => const ResetPasswordScreen(),
          BodyCompositionScreen.routeName: (_) => const BodyCompositionScreen(),
          BodyResult.routeName: (_) => BodyResult(),
        },
        initialRoute: CacheData.getData(key: "email") == null?
        SignInScreen.routeName : HomeScreen.routeName,
        home: const HomeScreen(),
      ),
    );
  }
}
