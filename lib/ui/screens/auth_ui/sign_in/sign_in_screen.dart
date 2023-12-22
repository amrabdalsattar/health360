import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/user_model.dart';

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

  bool _passwordShowed = true;

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
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
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Please sign in to continue",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                ),
                Column(
                  children: [
                    MyTextField(
                      validator: (email) {
                        if (!RegExp(
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                        ).hasMatch(email!)) {
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
                        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$')
                            .hasMatch(password)) {
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
                          _passwordShowed = !_passwordShowed;
                          setState(() {});
                        },
                        child: _passwordShowed == false
                            ? const Icon(CupertinoIcons.lock_open)
                            : const Icon(CupertinoIcons.lock),
                      ),
                      obscure: _passwordShowed,
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
                        child: Text(
                          "Forgot Password?",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
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
                    Text("Don't have an account?", style: Theme.of(context).textTheme.bodyMedium,),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, CreateAccountScreen.routeName);
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: provider.appMode == ThemeMode.light ?
                          AppColor.primary : AppColor.darkAccent),
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

        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        AppUser currentUser = await getUserFromFireStore(credential.user!.uid);
        AppUser.currentUser = currentUser;
        hideLoading(context);

        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        hideLoading(context);
        showErrorDialog(
            context, "Incorrect password or Email. Please try again.");
      } else {
        hideLoading(context);
        showErrorDialog(context, e.message!);
      }
    }
  }

  Future<AppUser> getUserFromFireStore(String id) async {
    CollectionReference<AppUser> userCollection = AppUser.collection();
    DocumentSnapshot<AppUser> documentSnapshot =
        await userCollection.doc(id).get();
    return documentSnapshot.data()!;
  }
}
