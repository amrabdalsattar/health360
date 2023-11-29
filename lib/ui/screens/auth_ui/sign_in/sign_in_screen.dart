import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/button.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/logo_collection.dart';
import 'package:health360/ui/screens/auth_ui/auth_shared_widgets/text_field.dart';
import 'package:health360/ui/screens/auth_ui/create_account/create_account_screen.dart';
import 'package:health360/utils/app_asset.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/settings_provider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "SignIn";

  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool passwordShowed = true;

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
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
                  const MyTextField(
                    label: 'EMAIL',
                    icon: Icon(Icons.email_outlined),
                  ),
                  MyTextField(
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
              MyButton(onPressed: (){},
                  text: "LOGIN"),
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
}
