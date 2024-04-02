import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/ui/screens/home_screen/components/app_bar.dart';
import 'package:health360/ui/screens/home_screen/components/bottom_nav_bar.dart';
import 'package:health360/utils/providers/tabs_provider.dart';
import 'package:provider/provider.dart';

import '../../tabs/community_tab/components/fab.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TabsProvider tabsProvider = TabsProvider();
    return ChangeNotifierProvider(
      create: (_) => tabsProvider,
      child: Consumer<TabsProvider>(
      builder: (_, viewModel, __) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.h),
            child: const CustomAppBar(),
          ),
          body: SafeArea(
              child: viewModel.tabs[viewModel.currentTabIndex]),
          bottomNavigationBar: BottomNav(tabsProvider: viewModel,),
          floatingActionButton: const FAB(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
