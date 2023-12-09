import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/utils/dialog_utils.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../../../utils/app_asset.dart';

class LogoCollection extends StatelessWidget {
  const LogoCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: (){
              signInWithGoogle(context);
            },
            child: Image.asset(AppAsset.google,
              width: 40, height: 40,)),
        InkWell(
          onTap: (){
            signInWithFacebook(context);

          },
            child: Image.asset(AppAsset.facebook,
              width: 30, height: 30,)),
        InkWell(
            onTap: (){
              showLoading(context);
              signInWithTwitter(context);
              hideLoading(context);

            },
            child: Image.asset(AppAsset.x,
              width: 22, height: 22,)),
      ],
    );
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
    print("User Signed in");
    // Once signed in, return the UserCredential
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    return await FirebaseAuth.instance.signInWithCredential(credential);

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
