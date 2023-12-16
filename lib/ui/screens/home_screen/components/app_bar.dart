import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health360/ui/shared_components/profile_photo.dart';
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
          child: const ProfilePhoto(),
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
