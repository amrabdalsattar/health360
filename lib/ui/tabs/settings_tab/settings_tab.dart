import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/button.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_screen.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/cache_helper.dart';
import 'package:provider/provider.dart';

import '../../../utils/providers/settings_provider.dart';

class SettingsTab extends StatelessWidget {
  static late SettingsProvider provider;

  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsTab.provider = Provider.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("settings".tr(),
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                buildRow(
                    "darkMode".tr(),
                    provider.switchState,
                        (switchMode) => {
                      provider.setSwitchState(switchMode),
                      if (provider.switchState == true)
                        {provider.setCurrentMode(ThemeMode.dark)}
                      else
                        {provider.setCurrentMode(ThemeMode.light)}
                    },
                    context),
              ],
            ),
          ),
          MyButton(
              text: "logOut".tr(), onPressed: (){
                print(CacheData.getData(key: "email"));
                print(CacheData.getData(key: "id"));
                print(CacheData.getData(key: "fullName"));
                CacheData.removeData(key: "email");
                CacheData.removeData(key: "fullName");
                CacheData.removeData(key: "password");
                CacheData.removeData(key: "id");
            Navigator.pushReplacementNamed(context, SignInScreen.routeName);

                print(CacheData.getData(key: "email"));
                print(CacheData.getData(key: "id"));
                print(CacheData.getData(key: "fullName"));
            provider.setCurrentTabIndex(0);
          })
        ],
      ),
    );
  }

  Widget buildRow(String text, bool switchValue, Function(bool) onChanged,
      BuildContext context) {
    Color switchColor = provider.appMode == ThemeMode.light
        ? AppColor.primary
        : AppColor.darkAccent;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: provider.appMode == ThemeMode.light ? AppColor.black :
                AppColor.white, fontWeight: FontWeight.bold
          ),
        ),
        Switch(
          value: switchValue,
          onChanged: onChanged,
          activeColor: switchColor,
        )
      ],
    );
  }
}
