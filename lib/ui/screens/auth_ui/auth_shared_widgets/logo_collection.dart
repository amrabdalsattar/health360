import 'package:flutter/material.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_methods/sign_in_with_facebook.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_methods/sign_in_with_google.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_methods/sign_in_with_x.dart';

class LogoCollection extends StatelessWidget {
  const LogoCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SignInWithGoogle(),
        SignInWithFacebook(),
        SignInWithX()
      ],
    );
  }



}
