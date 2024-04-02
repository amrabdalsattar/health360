import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/ui/shared_components/profile_photo.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/cache_helper.dart';
import 'package:health360/utils/dialog_utils.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    int maxCharacters = 200;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              provider.postContent = "";
                              Navigator.pop(context);
                            },
                            child: Icon(CupertinoIcons.xmark,
                              color: provider.appMode == ThemeMode.light?
                            AppColor.black : AppColor.white,)),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(provider.appMode == ThemeMode.light?
                                AppColor.primary : AppColor.darkAccent,),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if(provider.postContent.isNotEmpty){
                              showLoading(context);
                              addPostToFirestore(context);
                              provider.refreshPostsList();
                              provider.setPostContent("");
                              hideLoading(context);
                            }
                          },
                          child: Text("post".tr(), style: const TextStyle(fontSize: 14),),
                        )
                      ],
                    ),
                    const ProfilePhoto(width: 80, height: 75,),
                    TextField(
                      style: TextStyle(fontSize: 16.sp,
                        color: provider.appMode == ThemeMode.light?
                      AppColor.black : AppColor.white,),
                      autocorrect: true,
                      maxLines: null,
                      maxLength: maxCharacters,
                      decoration: InputDecoration(
                        fillColor: provider.appMode == ThemeMode.light?
                      AppColor.liteGrey : AppColor.darkPrimary,
                        filled: true,
                        hintText: "whatsOnUrMind".tr(),
                        counterText: "",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                      onChanged: (text) {
                        provider.setPostContent(text);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${provider.postContent.length}/$maxCharacters",
                        style: TextStyle(
                            color: provider.postContent.length == maxCharacters
                                ? AppColor.red
                                : AppColor.grey,
                            fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addPostToFirestore(BuildContext context) {
    CollectionReference postsCollectionRef =
        FirebaseFirestore.instance.collection("posts");

    DocumentReference newEmptyDoc = postsCollectionRef.doc();
    newEmptyDoc.set({
      "name": CacheData.getData(key: "fullName"),
      "photo": provider.profileImagePath,
      "content" : provider.postContent,
      "date": DateTime.now(),
      "id": CacheData.getData(key: "id"),
    }).timeout(const Duration(milliseconds: 300), onTimeout: () {
      provider.refreshPostsList();
      Navigator.pop(context);
    });
  }
}
