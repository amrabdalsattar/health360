import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/ui/tabs/community_tab/components/post.dart';
import 'package:provider/provider.dart';

import '../../../utils/providers/settings_provider.dart';

class CommunityTab extends StatefulWidget {
  const CommunityTab({super.key});

  @override
  State<CommunityTab> createState() => _CommunityTabState();
}

class _CommunityTabState extends State<CommunityTab> {
  late SettingsProvider provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshPostsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: provider.posts.length,
            itemBuilder: (context, index) => Post(
                  postDM: provider.posts[index],
                )),
      ),
    );
  }
}
