import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/tabs/community_tab/add_post_screen/add_post_screen.dart';
import 'package:health360/utils/app_color.dart';

class FAB extends StatelessWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(

      backgroundColor: AppColor.primary,
        onPressed: () {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => AddPostScreen());
    },
      child: const Icon(Icons.add, color: AppColor.white,),
    );
  }
}
