import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/data/models/user_model.dart';
import 'package:health360/ui/screens/home_screen/profile/profile_components/pick_image.dart';
import 'package:health360/ui/screens/home_screen/profile/profile_components/profile_text_field.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/cache_helper.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.xmark,
                  color: provider.appMode == ThemeMode.light
                      ? AppColor.black
                      : AppColor.white,
                )),
          ),
          Text(
            "${"hey".tr()}, ${firstName(CacheData.getData(key: "fullName"))}",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const PickImage(),
          ProfileTextField(
            text: "${"name".tr()}: ${CacheData.getData(key: "fullName")}",
          ),
          ProfileTextField(
            text: "${"email".tr()}: ${CacheData.getData(key: "email")}",
          ),
          ProfileTextField(
            text: "${"id".tr()}: ${CacheData.getData(key: "id")}",
          ),
        ],
      ),
    );
  }

  String firstName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    if (nameParts.isNotEmpty) {
      return nameParts[0];
    } else {
      return '';
    }
  }
}
