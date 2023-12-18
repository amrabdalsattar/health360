import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/dialog_utils.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = 'reset_password';

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  static final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      if (kDebugMode) {
        print("Error sending password reset email: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 50.0, bottom: 25.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, color: provider.appMode == ThemeMode.light?
                    AppColor.black : AppColor.white,),
                ),
                const SizedBox(height: 70),
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineLarge
                      ?.copyWith(fontSize: 35),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your email address to recover your password.',
                  style: Theme.of(context).textTheme.bodyLarge
                      ?.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 40),
                Text(
                  'Email address',
                  style: Theme.of(context).textTheme.bodyLarge
                      ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: false,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Empty email';
                    }
                    return null;
                  },
                  autofocus: false,
                  style: Theme.of(context).textTheme.bodyLarge
                      ?.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          30.0,
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: provider.appMode == ThemeMode.light?
                              AppColor.primary: AppColor.darkAccent, width: 2.0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          30.0,
                        ),
                      ),
                    ),

                    isDense: true,
                    // fillColor: kPrimaryColor,
                    filled: true,
                    errorStyle: TextStyle(fontSize: 15),
                    hintText: 'email address',
                    hintStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColor.grey),
                  ),
                ),
                const SizedBox(height: 16),
                const Expanded(child: SizedBox()),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    child: MaterialButton(
                      onPressed: () async {
                        if (_emailController.text.isNotEmpty &&
                            RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                            ).hasMatch(_emailController.text)) {
                          await resetPassword(
                              email: _emailController.text.trim());
                          Navigator.pop(context);
                        } else {
                          showErrorDialog(context, "Invalid Email");
                        }
                      },
                      minWidth: double.infinity,
                      child: const Text(
                        'RECOVER PASSWORD',
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
