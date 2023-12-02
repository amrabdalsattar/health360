import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final Widget icon;
  final bool obscure;
  final bool? visible;
  final String? Function(String?)? validator;
  final Color? formValidationColor;

  final void Function(String)? onChanged;
  const MyTextField({super.key,
    required this.label,
    required this.icon,
    this.obscure = false,
    this.onChanged,
    this.errorText,
    this.visible = false,
    this.validator,
    this.formValidationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),

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
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: formValidationColor!, width: 2.0),
                  borderRadius: const BorderRadius.all(
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
                labelText: label,
                prefixIcon: icon,
                prefixIconColor: AppColor.grey,
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