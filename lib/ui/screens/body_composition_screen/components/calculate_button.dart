import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_color.dart';
import '../result/body_result.dart';

class CalculateButton extends StatelessWidget {
  final void Function()? onPressed;
  const CalculateButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(AppColor.grey),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            fixedSize: MaterialStateProperty.all(Size.fromWidth(
                MediaQuery.of(context).size.width * .9))),
        onPressed: () {
          var result =
              provider.weight / pow(provider.heightValue / 100, 2);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BodyResult(bMIResult: result,);
          }));
        },
        child: Text("Calculate"));
  }
}
