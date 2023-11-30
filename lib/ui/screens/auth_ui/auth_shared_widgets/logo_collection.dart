import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../utils/app_asset.dart';

class LogoCollection extends StatelessWidget {
  const LogoCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: (){},
            child: Image.asset(AppAsset.google,
              width: 40, height: 40,)),
        InkWell(
          onTap: (){

          },
            child: Image.asset(AppAsset.facebook,
              width: 30, height: 30,)),
        InkWell(
            onTap: (){},
            child: Image.asset(AppAsset.x,
              width: 22, height: 22,)),
      ],
    );
  }
  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}
