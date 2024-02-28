import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../utils/app_asset.dart';
import '../../../home_screen/home_screen.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          signInWithGoogle(context);
        },
        child: Image.asset(AppAsset.google,
          width: 30.w, height: 30.h,));
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
}
