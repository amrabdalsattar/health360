import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/dialog_utils.dart';
import '../../../../utils/settings_provider.dart';
import '../auth_shared_widgets/button.dart';
import '../auth_shared_widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountScreen extends StatefulWidget {
  static const routeName = "createAccount";
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  String email = "";

  String password = "";

  String confirmedPassword = "";

  String fullName = "";

  String? errorMessage;

  Color? errorMessageColor;

  bool passwordShowed = true;
  bool confirmPasswordShowed = true;
  bool error = false;
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.grey),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              /// change it to headline-large
              const Text(
                "Create Account",
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              Form(
                  child: Column(
                    children: [
                      MyTextField(
                        onChanged: (text){
                          fullName = text;
                        },
                        label: 'FULL NAME',
                        icon: Icon(Icons.person),

                      ),
                      MyTextField(
                        onChanged: (text){
                          email = text;
                        },
                        label: 'EMAIL',
                        icon: Icon(Icons.email_outlined),
                      ),
                      MyTextField(
                        error: error,
                        errorText: errorMessage,
                          errorMessageColor: errorMessageColor,
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
                          obscure: passwordShowed,
                          validator: (data) {
                            if (password == true) {
                              if (data!.isEmpty) {
                                return "";
                              } else if (data.length > 6 &&
                                  !data.contains(RegExp(r'[A-Z]')) ||
                                  !data.contains(RegExp(r'[a-z]'))) {
                                // Set error and return an error message
                                error = true;
                                return "Weak Password";
                              }else{
                                error = false;
                                return "Strong Password";
                              }
                            }
                            // Reset error
                            error = false;
                            return null;
                          },
                          ),
                      MyTextField(
                          onChanged: (text){
                            confirmedPassword = text;
                          },
                          label: 'CONFIRM PASSWORD',
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
                  )),
              MyButton(onPressed: (){
                register();
              },
                  text: "SIGN UP"),

            ],
          ),
        ),
      ),
    );
  }
  void register() async {
    print(fullName);

    try {
      if (fullName.isEmpty) {
        showErrorDialog(context, "Your Name is Required, Please Enter your Full Name");
        return;
      } else if (fullName.contains(RegExp(r'[0-9]'))) {
        showErrorDialog(context, "Invalid Name");
        return;
      } else if (!fullName.contains(" ")) {
        showErrorDialog(context, "Please Enter your Full Name not First Name");
        return;
      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email)) {
        showErrorDialog(context, "Invalid Email");
        return;
      } else if (!isPasswordStrong(password)) {
        showErrorDialog(context, "Weak Password");
        return;
      } else if (password != confirmedPassword) {
        showErrorDialog(context, "The two passwords entered do not match. Please try again.");
        return;
      }

      showLoading(context);

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      hideLoading(context);
      print("User Added");
    } on FirebaseAuthException catch (error) {
      hideLoading(context);
      showErrorDialog(context, error.message ?? "Something went wrong. Please try again later!");
    }
  }

  bool isPasswordStrong(String password) {
    return password.length >= 6 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[0-9]'));
  }


}
