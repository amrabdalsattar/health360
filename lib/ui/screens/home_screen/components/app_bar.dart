import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/ui/shared_components/profile_photo.dart';
import 'package:health360/utils/app_theme.dart';
import 'package:health360/utils/cache_helper.dart';

import '../../../../utils/app_color.dart';
import '../profile/profile.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            CacheData.getData(key: "fullName"),
            style: TextStyle(color: Theme.of(context) == AppTheme.lightMode?
            AppColor.grey : AppColor.darkGrey, fontSize: 14.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Health360",
            style: Theme.of(context).textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).canvasColor,
      toolbarHeight: 100,
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(60),
          child: ProfilePhoto(width: 38.w, height: 50.h,),
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
