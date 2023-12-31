import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
          /// if the gender is male or female as should we pass in constructor
          if (type == "male") {
            provider.setGender(true);
          } else {
            provider.setGender(false);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            /// Color Changing when the gender selected
              color: provider.appMode == ThemeMode.light
                  ? ((provider.isMale && type == "male") ||
                          (!provider.isMale && type == "female")
                      ? AppColor.primary
                      : AppColor.liteGrey)
                  : ((provider.isMale && type == "male") ||
                          (!provider.isMale && type == "female")
                      ? AppColor.darkPrimary
                      : AppColor.liteGrey),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                /// the gender icon
                type == "male" ? Icons.male : Icons.female,
                size: 50,
                color: AppColor.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                /// the text that feed us back if the user is male of female
                type == "male" ? "male" : "female",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
