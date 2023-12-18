import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Icon icon;
  const MyButton({super.key,
    required this.text,
    required this.onPressed,
    this.icon = const Icon(CupertinoIcons.arrow_right, size: 18,)
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),


            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text),
                const Spacer(),
                icon
              ],
            )),
      ),
    );
  }
}
