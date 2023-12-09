import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';

class ProfileTextField extends StatelessWidget {
  final String text;
  const ProfileTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColor.primary, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(
              30.0,
            ),
          ),
        ),
        fillColor: AppColor.liteGrey,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        labelText: text
      ),
      enabled: false,

    );
  }
}
