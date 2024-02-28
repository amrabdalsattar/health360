import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_color.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final Widget icon;
  final bool obscure;
  final bool? visible;
  final String? Function(String?)? validator;


  final void Function(String)? onChanged;
  const MyTextField({super.key,
    required this.label,
    required this.icon,
    this.obscure = false,
    this.onChanged,
    this.errorText,
    this.visible = false,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      decoration: const BoxDecoration(),

      child: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            TextFormField(
              autofocus: false,
              validator: validator,
              onChanged: onChanged,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: provider.appMode == ThemeMode.light?
                  AppColor.primary : AppColor.darkAccent, width: 2.w),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      30.h,
                    ),
                  ),
                ),
                fillColor: AppColor.liteGrey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: BorderSide.none,
                ),
                labelText: label,
                prefixIcon: icon,
                prefixIconColor: AppColor.grey,
                suffixIcon: Visibility(
                  visible: visible!,
                  child: const Icon(Icons.check_circle, color: Colors.green,),

                ),
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColor.grey),
              ),
              style: TextStyle(
                color: provider.appMode == ThemeMode.light?
                AppColor.black : AppColor.white,
                fontWeight: FontWeight.bold,
              ),
              obscureText: obscure,
            ),
          ],
        ),
      ),
    );
  }

}