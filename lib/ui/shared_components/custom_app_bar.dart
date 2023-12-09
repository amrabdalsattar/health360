import 'package:flutter/material.dart';

import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Welcome back!", style: TextStyle(color: AppColor.grey, fontSize: 14),),
          SizedBox(height: 10,),
          Text("Amr Abd-Alsattar", style: TextStyle(color: AppColor.black),),
        ],
      ),
      backgroundColor: AppColor.white,
      toolbarHeight: 100,
      actions: [Container(
        width: 100,
        padding: EdgeInsets.all(6),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(AppAsset.me, fit: BoxFit.cover,)),
      ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}