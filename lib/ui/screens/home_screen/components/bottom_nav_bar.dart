import 'package:flutter/material.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_color.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: AppColor.white
      ),
      child: BottomAppBar(
        notchMargin: 4,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shadowColor: AppColor.primary,
        child: BottomNavigationBar(
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.black,
            unselectedItemColor: AppColor.grey,
            currentIndex: provider.currentTabIndex,
            onTap: (index){
              provider.setCurrentTabIndex(index);
            },
            items: const [BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Fitness"),
              BottomNavigationBarItem(icon: Icon(Icons.people_rounded), label: "Community"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
            ]
        ),
      ),
    );;
  }
}
