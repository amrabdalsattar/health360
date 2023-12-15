import 'package:flutter/material.dart';
import 'package:health360/utils/app_color.dart';

class BodyCompositionAppBar extends StatelessWidget {
  final String title;
  const BodyCompositionAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      backgroundColor: AppColor.grey,
      title: Text(title),
      centerTitle: true,
      elevation: 0,
    );
  }
}
