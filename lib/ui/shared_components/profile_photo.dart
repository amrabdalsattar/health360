import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/app_color.dart';
import '../../utils/providers/settings_provider.dart';

class ProfilePhoto extends StatelessWidget {
  final double width;
  final double height;

  const ProfilePhoto({super.key,required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColor.grey, width: 2.w)),
        width: width.w,
        height: height.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
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
