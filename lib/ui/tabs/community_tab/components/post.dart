import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/post_model.dart';
import '../../../../utils/app_color.dart';

class Post extends StatelessWidget {
  final PostDM postDM;

  const Post({super.key, required this.postDM});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), border: Border.all()),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColor.grey, width: 2)),
                        width: 60,
                        height: 40,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
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
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                formatTimeAgo(postDM.date),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(postDM.postContent),
                      ],
                    ),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.comment_outlined,
                    color: AppColor.grey,
                    size: 19,
                  ),
                  Icon(
                    CupertinoIcons.repeat,
                    color: AppColor.grey,
                    size: 19,
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: AppColor.grey,
                    size: 19,
                  ),
                  Icon(
                    CupertinoIcons.share,
                    color: AppColor.grey,
                    size: 19,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  String formatTimeAgo(DateTime dateTime) {
    Duration difference = DateTime.now().difference(dateTime);

    if (difference.inDays > 0) {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'just now';
    }
  }
}
