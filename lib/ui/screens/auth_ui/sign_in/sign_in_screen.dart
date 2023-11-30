import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/button.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/logo_collection.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/text_field.dart';
import 'package:health360/ui/screens/auth_ui/create_account/create_account_screen.dart';
import 'package:health360/ui/screens/auth_ui/forgot_password.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/utils/app_asset.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/dialog_utils.dart';
import 'package:health360/utils/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "SignIn";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = "";

  String password = "";

  bool passwordShowed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              /// change it to headline-large
              const Text(
                "Login",
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              /// change it to headline-medium
              const Text("Please sign in to continue",
                  style: TextStyle(
                      color: AppColor.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              Form(
                  child: Column(
                children: [
                  MyTextField(
                    onChanged: (text){
                      email = text;
                    },
                    label: 'EMAIL',
                    icon: Icon(Icons.email_outlined),
                  ),
                  MyTextField(
                    onChanged: (text){
                      password = text;
                    },
                      label: 'PASSWORD',
                      icon: InkWell(
                        onTap: () {
                          passwordShowed = !passwordShowed;
                          setState(() {});
                        },
                        child: passwordShowed == false
                            ? const Icon(CupertinoIcons.lock_open)
                            : const Icon(CupertinoIcons.lock),
                      ),
                      obscure: passwordShowed),
                ],
              )),
              Row(
                children: [
                  TextButton(
                      onPressed: (){
                    Navigator.pushNamed(context, ResetPasswordScreen.routeName);
                  },
                      child: Text("Forgot Password?",
                        style: TextStyle(color: AppColor.primary),)),
                  const Spacer(),
                  MyButton(onPressed: (){
                    login();
                  },
                      text: "LOGIN"),
                ],
              ),
              const Text("or Login with", 
                style: TextStyle(color: AppColor.grey),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
              const LogoCollection(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, CreateAccountScreen.routeName);
                  }, child: Text("Sign up", style: TextStyle(color: AppColor.primary),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void login() async {
    try {
      if (email.isEmpty ||
          !RegExp(
            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
          ).hasMatch(email)) {
        showErrorDialog(context, "Please Enter a Valid Email");
        return;
      } else if (password.isEmpty) {
        showErrorDialog(context, "Please Enter your Password");
        return;
      }
      showLoading(context);

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      hideLoading(context);
      // If login is successful, navigate to the home screen
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      print("the Exception is -------------------------------- ${e.code}");
      print("the message is -------------------------------- ${e.message}");

      // Differentiate between specific error codes
      if (e.code == 'invalid-credential') {
        hideLoading(context);
        showErrorDialog(context, "Incorrect password or Email. Please try again.");

      } else if (e.message == 'user-not-found') {
        hideLoading(context);
        showErrorDialog(context, "User not found. Please check your email.");
      } else {
        hideLoading(context);
        // For other errors, show a general error message
        showErrorDialog(context, "An error occurred: ${e.message}");
      }
    }
  }


}
