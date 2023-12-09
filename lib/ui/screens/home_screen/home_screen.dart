import 'package:flutter/material.dart';
import 'package:health360/ui/shared_components/bottom_nav_bar.dart';
import 'package:health360/utils/app_asset.dart';
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
      appBar: AppBar(
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text("Amr Abd-Alsattar",
              style: TextStyle(color: AppColor.grey, fontSize: 14),),
            SizedBox(height: 10,),
            Text("Health360", style: TextStyle(color: AppColor.black),),
          ],
        ),
        backgroundColor: AppColor.white,
        toolbarHeight: 100,
        actions: [Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              radius: 22,

              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(AppAsset.me)),
            ))
        ],
      ),
      body: provider.navigateTab(provider.currentTabIndex, provider.tabs),
      bottomNavigationBar: const BottomNav(),
    );
  }

}
