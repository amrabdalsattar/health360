import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';


class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor),
      child: BottomAppBar(
        notchMargin: 4,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BottomNavigationBar(
            currentIndex: provider.currentTabIndex,
            onTap: (index) {
              provider.setCurrentTabIndex(index);
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
  }
}
