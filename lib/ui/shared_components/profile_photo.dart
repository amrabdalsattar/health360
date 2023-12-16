import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_color.dart';
import '../../utils/providers/settings_provider.dart';

class ProfilePhoto extends StatelessWidget {
  final double width;
  final double height;

  const ProfilePhoto({super.key, this.width = 80, this.height = 80});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColor.grey, width: 2)),
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: provider.isAssetPath
                ? Image.asset(
                    provider.profileImagePath,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(provider.profileImagePath),
                    fit: BoxFit.cover,
                  )));
  }
}
