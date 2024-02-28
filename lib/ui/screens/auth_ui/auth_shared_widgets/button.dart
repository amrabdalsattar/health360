import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double fontSize;

  const MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.fontSize = 10});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 30.h),
        width: 110.w,
        height: 45.h,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
            ),

            onPressed: onPressed,
            child: Row(
              children: [
                Expanded(
                    flex: 8,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: fontSize.sp),
                    )),
                Expanded(
                    flex: 2,
                    child: Icon(
                      context.locale == const Locale('ar')
                          ? CupertinoIcons.arrow_left
                          : CupertinoIcons.arrow_right,
                      size: 14.sp,
                    ))
              ],
            )),
      ),
    );
  }
}
