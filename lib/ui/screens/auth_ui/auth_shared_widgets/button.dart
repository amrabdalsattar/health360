import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double fontSize;

  const MyButton({super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 10});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        width: MediaQuery
            .of(context)
            .size
            .width * 0.3,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.06,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(Theme
                  .of(context)
                  .primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
            ),
            onPressed: onPressed,
            child: Row(
              children: [
                Expanded(flex: 8,
                    child: Text(text, style: TextStyle(fontSize: fontSize),)),
                Expanded(flex: 2, child: Icon(
                  context.locale == const Locale('ar') ?
                  CupertinoIcons.arrow_left: CupertinoIcons.arrow_right,
                  size: 14,
                ))
              ],
            )),
      ),
    );
  }
}
