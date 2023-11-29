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

  String userName = "";

  bool passwordShowed = true;
  bool confirmPasswordShowed = true;
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
                      const MyTextField(
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
    print("entered");
    try {
      showLoading(context);

        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print("user Added");
      hideLoading(context);
    } on FirebaseAuthException catch (error) {
      hideLoading(context);
      showErrorDialog(context,
          error.message ?? "Something went wrong. please try again later!");
    }
  }
}
