import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final Widget icon;
  final bool obscure;
  final bool? error;
  final Color? errorMessageColor;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const MyTextField({super.key,
    required this.label,
    required this.icon,
    this.obscure = false,
    this.onChanged,
    this.validator,
    this.errorText,
    this.errorMessageColor,
    this.error = false,
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

              validator: validator,
              onChanged: onChanged,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: errorMessageColor),
                errorText: error == true? errorText : null,
                fillColor: AppColor.liteGrey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                labelText: label,
                prefixIcon: icon,
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