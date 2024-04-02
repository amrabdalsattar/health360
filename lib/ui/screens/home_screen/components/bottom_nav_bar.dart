import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/utils/providers/tabs_provider.dart';
import 'package:provider/provider.dart';


class BottomNav extends StatelessWidget {
  final TabsProvider tabsProvider;
  const BottomNav({super.key, required this.tabsProvider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => tabsProvider,
      child: Consumer<TabsProvider>(
        builder: (_, viewModel, __){
          return Theme(
            data: Theme.of(context).copyWith(
                canvasColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor),
            child: BottomAppBar(
              notchMargin: 4,
              shape: const CircularNotchedRectangle(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: BottomNavigationBar(
                  currentIndex: viewModel.currentTabIndex,
                  onTap: (index) {
                    viewModel.setCurrentTabIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.home_filled),
                        label: "home".tr()),
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.fitness_center),
                        label: "fitness".tr()),
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.people_rounded),
                        label: "community".tr()),
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.settings),
                        label: "settings".tr()),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
