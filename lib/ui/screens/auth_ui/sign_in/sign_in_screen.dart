import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:health360/utils/cache_helper.dart';
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
                  "login",
                  style: Theme.of(context).textTheme.headlineLarge,
                ).tr(),
                const SizedBox(
                  height: 10,
                ),
                Text("plsSignToCon",
                        style: Theme.of(context).textTheme.headlineMedium)
                    .tr(),
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
                          return "emailNotValid".tr();
                        }
                        return null;
                      },
                      onChanged: (text) {
                        email = text;
                      },
                      label: "email".tr(),
                      icon: const Icon(Icons.email_outlined),
                    ),
                    MyTextField(
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return "passwordRequired".tr();
                        }

                        // Check if the password has at least one uppercase, one lowercase, and a minimum of 6 characters
                        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$')
                            .hasMatch(password)) {
                          return "passwordIsIncorrect".tr();
                        }

                        return null;
                      },
                      onChanged: (text) {
                        password = text;
                      },
                      label: "password".tr(),
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
                          "forgotPassword".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )),
                    const Spacer(),
                    MyButton(
                        fontSize: 10,
                        onPressed: () {
                          login();
                        },
                        text: "login".tr().toUpperCase()),
                  ],
                ),
                Text(
                  "orLoginWith".tr(),
                  style: const TextStyle(color: AppColor.grey),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const LogoCollection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "haveNoAcc".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, CreateAccountScreen.routeName);
                        },
                        child: Text(
                          "signUp".tr(),
                          style: TextStyle(
                              color: provider.appMode == ThemeMode.light
                                  ? AppColor.primary
                                  : AppColor.darkAccent),
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
        /// Sign in with FireBase Authentication
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        /// Sign in with FireBase FireStore
        AppUser currentUser = await getUserFromFireStore(credential.user!.uid);
        AppUser.currentUser = currentUser;
        CacheData.setData(
            key: "fullName", value: AppUser.currentUser!.fullName);
        CacheData.setData(key: "id", value: AppUser.currentUser!.id);
        CacheData.setData(key: "email", value: email);
        CacheData.setData(key: "password", value: password);
        hideLoading(context);

        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        hideLoading(context);
        showErrorDialog(context, "incorrectPassOrEmail".tr());
      } else {
        hideLoading(context);
        showErrorDialog(context, e.message!);
      }
    }
  }
  /// Getting user from Firestore to help in retrieving data and caching it
  Future<AppUser> getUserFromFireStore(String id) async {
    CollectionReference<AppUser> userCollection = AppUser.collection();
    DocumentSnapshot<AppUser> documentSnapshot =
        await userCollection.doc(id).get();
    return documentSnapshot.data()!;
  }
}
