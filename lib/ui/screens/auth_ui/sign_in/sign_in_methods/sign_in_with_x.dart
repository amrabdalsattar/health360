import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../../../../utils/app_asset.dart';
import '../../../../../utils/dialog_utils.dart';
import '../../../home_screen/home_screen.dart';

class SignInWithX extends StatelessWidget {
  const SignInWithX({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          showLoading(context);
          signInWithTwitter(context);
          hideLoading(context);

        },
        child: Image.asset(AppAsset.x,
          width: 22, height: 22,));
  }

  Future<UserCredential> signInWithTwitter(BuildContext context) async {
    showLoading(context);
    // Create a TwitterLogin instance
    final twitterLogin = TwitterLogin(
        apiKey: 'PIe88BYkqGGRIcj4jU4zP2xSP',
        apiSecretKey:'H6FCGh3m5DKG5sVO48w98ydFgQ8O0tsix20dhPXLdNOvF5iXNK',
        redirectURI: 'https://twitter.com/amr_devv'
    );

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();
    hideLoading(context);

    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential

    return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

  }
}
