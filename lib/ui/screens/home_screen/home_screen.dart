import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health360/data/models/user_model.dart';
import 'package:health360/ui/screens/home_screen/profile/profile.dart';
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppUser.currentUser!.fullName,
              style: const TextStyle(color: AppColor.grey, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Health360",
              style: TextStyle(color: AppColor.black),
            ),
          ],
        ),
        backgroundColor: AppColor.white,
        toolbarHeight: 100,
        actions: [
          InkWell(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColor.grey, width: 2)),
                width: 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: provider.isAssetPath
                        ? Image.asset(provider.profileImagePath)
                        : Image.file(
                            File(provider.profileImagePath),
                            fit: BoxFit.cover,
                          ))),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: const Profile()));
            },
          )
        ],
      ),
      body: provider.navigateTab(provider.currentTabIndex, provider.tabs),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
