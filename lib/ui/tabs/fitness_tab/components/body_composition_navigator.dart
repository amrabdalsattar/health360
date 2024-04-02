import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/ui/screens/body_composition_screen/body_composition_screen.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_color.dart';

class BodyCompositionNavigator extends StatelessWidget {
  const BodyCompositionNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.pushNamed(context, BodyCompositionScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(15.w),
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.liteGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: provider.appMode == ThemeMode.light
                            ? AppColor.primary
                            : AppColor.darkAccent,
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.man,
                      size: 40.sp,
                    )),
                SizedBox(
                  width: 16.w,
                ),
                Text("bodyComposition",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColor.grey, fontSize: 18.sp),
                ).tr(),
              ],
            ),
            Icon(
              Icons.arrow_forward,
              color: provider.appMode == ThemeMode.light
                  ? AppColor.black
                  : AppColor.white,
            )
          ],
        ),
      ),
    );
  }
}
