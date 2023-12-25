import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/data/models/user_model.dart';
import 'package:health360/ui/screens/home_screen/home_screen.dart';
import 'package:health360/utils/cache_helper.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/dialog_utils.dart';
import '../auth_shared_widgets/button.dart';
import '../auth_shared_widgets/text_field.dart';

class CreateAccountScreen extends StatefulWidget {
  static const routeName = "createAccount";

  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = "";

  String password = "";

  String confirmedPassword = "";

  String fullName = "";

  String? errorMessage;

  bool passwordShowed = true;
  bool confirmPasswordShowed = true;
  bool error = false;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.grey),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                /// change it to headline-large
                Text(
                  "createAcc".tr(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                ),
                Column(
                  children: [
                    MyTextField(
                      validator: (fullName) {
                        if (fullName == null || fullName.isEmpty) {
                          return "reqName".tr();
                        } else if (fullName.contains(RegExp(r'[0-9]'))) {
                          return "invalidName".tr();
                        } else if (!fullName.contains(" ")) {
                          return "enterFullName".tr();
                        }
                        return null;
                      },
                      onChanged: (text) {
                        fullName = text;
                      },
                      label: "fullName".tr(),
                      icon: const Icon(Icons.person),
                    ),
                    MyTextField(
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return "emailEmpty".tr();
                        }
                        if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(email)) {
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
                        if (!isPasswordStrong(password)) {
                          return "charsValidation".tr();
                        }
                        return null;
                      },
                      visible:
                          isPasswordStrong(password) == true ? true : false,
                      onChanged: (text) {
                        password = text;
                      },
                      label: "password".tr(),
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
                    MyTextField(
                        validator: (confirmedPassword) {
                          if (password != confirmedPassword &&
                              confirmedPassword != null &&
                              confirmedPassword.isNotEmpty) {
                            return "passwordsNotMatched".tr();
                          }
                          return null;
                        },
                        visible:
                            matchedPassword(password, confirmedPassword) == true
                                ? true
                                : false,
                        onChanged: (text) {
                          confirmedPassword = text;
                        },
                        label: "confirmPassword".tr(),
                        icon: InkWell(
                          onTap: () {
                            confirmPasswordShowed = !confirmPasswordShowed;
                            setState(() {});
                          },
                          child: confirmPasswordShowed == false
                              ? const Icon(CupertinoIcons.lock_open)
                              : const Icon(CupertinoIcons.lock),
                        ),
                        obscure: confirmPasswordShowed),
                  ],
                ),
                MyButton(
                    onPressed: () {

                      register();
                    },
                    text: "signUp".tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    try {
      if (_formKey.currentState!.validate()) {
        showLoading(context);

        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );


        AppUser newUser = AppUser(
            id: userCredential.user!.uid,
            email: email,
            fullName: fullName);
        await registerUserInFireStore(newUser);

        AppUser.currentUser = newUser;
        CacheData.setData(key: "email", value: email);
        CacheData.setData(key: "password", value: password);
        CacheData.setData(key: "fullName", value: fullName);
        CacheData.setData(key: "id", value: userCredential.user!.uid);

        hideLoading(context);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    } on FirebaseAuthException catch (error) {
      hideLoading(context);
      showErrorDialog(context, error.message ?? "somethingWentWrong".tr());
    }
  }

  bool isPasswordStrong(String password) {
    return password.length >= 6 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[0-9]'));
  }

  bool matchedPassword(String password, String confirmedPassword) {
    if (password.isNotEmpty && password == confirmedPassword) {
      return true;
    }
    return false;
  }

  Future registerUserInFireStore(AppUser user) async {
    CollectionReference<AppUser> usersCollection = AppUser.collection();
    await usersCollection.doc(user.id).set(user);
  }
}
