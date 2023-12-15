import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/user_model.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/providers/settings_provider.dart';
import '../profile/profile.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return AppBar(
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
    );
  }
}
