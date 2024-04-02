import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountDownButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color color;

  const CountDownButton(
      {super.key,
        required this.onPressed,
        required this.title,
        this.color = Colors.black,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
          backgroundColor: MaterialStateProperty.all(color)
        ),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(fontSize: 14.sp),));
  }
}
