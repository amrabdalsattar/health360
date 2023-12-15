import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../../utils/app_asset.dart';
import '../../../../../utils/dialog_utils.dart';
import '../../../home_screen/home_screen.dart';

class SignInWithFacebook extends StatelessWidget {
  const SignInWithFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          signInWithFacebook(context);

        },
        child: Image.asset(AppAsset.facebook,
          width: 30, height: 30,));
  }

  Future<dynamic> signInWithFacebook(BuildContext context) async {
    try{
      showLoading(context);
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      hideLoading(context);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e){
      hideLoading(context);
      showErrorDialog(context, e.toString());
    }

  }
}
