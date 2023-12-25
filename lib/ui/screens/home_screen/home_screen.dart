import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/screens/home_screen/components/app_bar.dart';
import 'package:health360/ui/screens/home_screen/components/bottom_nav_bar.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_theme.dart';
import '../../tabs/community_tab/components/fab.dart';
import '../auth_ui/create_account/create_account_screen.dart';
import '../auth_ui/forgot_password.dart';
import '../auth_ui/sign_in/sign_in_screen.dart';
import '../body_composition_screen/body_composition_screen.dart';
import '../body_composition_screen/result/body_result.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return MaterialApp(
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
      home: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppBar(),
        ),
        body: SafeArea(child: provider.navigateTab(provider.currentTabIndex, provider.tabs)),
        bottomNavigationBar: const BottomNav(),
        floatingActionButton: const FAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
