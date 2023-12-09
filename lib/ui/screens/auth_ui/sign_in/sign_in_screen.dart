import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/button.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/logo_collection.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/text_field.dart';
import 'package:health360/ui/screens/auth_ui/create_account/create_account_screen.dart';
import 'package:health360/ui/screens/auth_ui/forgot_password.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/dialog_utils.dart';

class SignInScreen extends StatefulWidget {

  static const routeName = "SignIn";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                Column(
                  children: [
                    MyTextField(

                      validator: (email){
                        if(!RegExp(
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                        ).hasMatch(email!)){

                          return "Email isn't valid";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        email = text;
                      },
                      label: 'EMAIL',
                      icon: const Icon(Icons.email_outlined),
                    ),
                    MyTextField(

                      validator: (password) {
                        if (password == null || password.isEmpty) {

                          return "Password is required";
                        }

                        // Check if the password has at least one uppercase, one lowercase, and a minimum of 6 characters
                        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$').hasMatch(password)) {

                          return "Password is incorrect";
                        }

                        return null;
                      },
                      onChanged: (text) {
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
                      obscure: passwordShowed,
                    ),

                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {

                          Navigator.pushNamed(
                              context, ResetPasswordScreen.routeName);
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: AppColor.secondary),
                        )),
                    const Spacer(),
                    MyButton(
                        onPressed: () {
                          login();
                        },
                        text: "LOGIN"),
                  ],
                ),
                const Text(
                  "or Login with",
                  style: TextStyle(color: AppColor.grey),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const LogoCollection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, CreateAccountScreen.routeName);
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: AppColor.primary),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      if (_formKey.currentState!.validate()) {
        showLoading(context);

        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        hideLoading(context);

        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Welcome back!')),
        );
      }

    } on FirebaseAuthException catch (e) {

      if (e.code == 'invalid-credential') {

        hideLoading(context);
        showErrorDialog(
            context, "Incorrect password or Email. Please try again.");
      }else{
        hideLoading(context);
        showErrorDialog(
            context, e.message!);
      }
    }
  }
}
