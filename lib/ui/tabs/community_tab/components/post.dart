import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/post_model.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_theme.dart';

class Post extends StatelessWidget {
  final PostDM postDM;

  const Post({super.key, required this.postDM});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 20.h),
          margin: EdgeInsets.only(top: 20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context) == AppTheme.lightMode
                    ? AppColor.black
                    : AppColor.darkPrimary,
              )),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColor.grey, width: 2)),
                        width: 10.w,
                        height: 40.h,
                        margin: EdgeInsets.symmetric(
                            horizontal: 26.w, vertical: 25.h),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: postDM.photoPath.contains("assets")
                                ? Image.asset(
                                    postDM.photoPath,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(postDM.photoPath),
                                    fit: BoxFit.cover,
                                  ))),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Expanded(
                              child: Text(
                                postDM.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                formatTimeAgo(postDM.date, context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(postDM.postContent),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.comment_outlined,
                    color: AppColor.grey,
                    size: 19.sp,
                  ),
                  Icon(
                    CupertinoIcons.repeat,
                    color: AppColor.grey,
                    size: 19.sp,
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: AppColor.grey,
                    size: 19.sp,
                  ),
                  Icon(
                    CupertinoIcons.share,
                    color: AppColor.grey,
                    size: 19.sp,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  String formatTimeAgo(DateTime dateTime, BuildContext context) {
    Duration difference = DateTime.now().difference(dateTime);

    if (difference.inDays > 0) {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return "justNow".tr();
    }
  }
}
