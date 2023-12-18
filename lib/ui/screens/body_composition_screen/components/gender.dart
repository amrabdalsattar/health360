import 'package:flutter/material.dart';
import 'package:health360/utils/app_theme.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_color.dart';

class Gender extends StatelessWidget {
 final String type;
  const Gender({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if(type == "male"){
            provider.setGender(true);
          }else{
            provider.setGender(false);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: provider.appMode == ThemeMode.light ? (
              (provider.isMale && type == "male")
                  || (!provider.isMale && type == "female")
                  ? AppColor.primary
                  : AppColor.liteGrey ): (
                  (provider.isMale && type == "male")
                      || (!provider.isMale && type == "female")
                      ? AppColor.darkPrimary
                      : AppColor.liteGrey ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 50,
                color: AppColor.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == "male" ? "Male" : "Female",
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
