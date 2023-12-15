import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_methods/sign_in_with_facebook.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_methods/sign_in_with_google.dart';
import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_methods/sign_in_with_x.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/utils/dialog_utils.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../../../utils/app_asset.dart';

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
