import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final Widget icon;
  final bool obscure;
  final bool? visible;

  final void Function(String)? onChanged;
  const MyTextField({super.key,
    required this.label,
    required this.icon,
    this.obscure = false,
    this.onChanged,
    this.errorText,
    this.visible = false,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),

      /// Adjust the `top` value to change the position of the label
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                fillColor: AppColor.liteGrey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                labelText: label,
                prefixIcon: icon,
                suffixIcon: Visibility(
                  visible: visible!,
                  child: const Icon(Icons.check_circle, color: Colors.green,),

                ),
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
              style: const TextStyle(
                color: AppColor.black,
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