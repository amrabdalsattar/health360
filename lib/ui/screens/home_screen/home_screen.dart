import 'package:flutter/material.dart';
import 'package:health360/ui/screens/home_screen/components/app_bar.dart';
import 'package:health360/ui/screens/home_screen/components/bottom_nav_bar.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(),
      ),
      body: SafeArea(child: provider.navigateTab(provider.currentTabIndex, provider.tabs)),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
