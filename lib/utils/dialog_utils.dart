import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/screens/auth_ui/create_account/create_account_screen.dart';
import 'package:health360/utils/app_color.dart';

void showLoading(BuildContext context){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (_){
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          content: const Row(
            children: [
              Text("Loading..."),
              Spacer(),
              CircularProgressIndicator(color: AppColor.primary,),
            ],
          ),
        );
      });
}


void hideLoading(BuildContext context){
  Navigator.pop(context);
}

void signInErrorDialog(BuildContext context, String errorMessage){
  showDialog(context: context, builder: (_) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      title: Text(
        "Error!",
        style: TextStyle(
          color: Colors.red, // Change the text color
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      content: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "OK",
            style: TextStyle(
              color: Colors.blue, // Change the button text color
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateAccountScreen.routeName);
          },
          child: const Text(
            "CREATE NEW ACCOUNT",
            style: TextStyle(
              color: AppColor.primary, // Change the button text color
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );

  });
}

void showErrorDialog(BuildContext context, String message){
  showDialog(context: context, builder: (_) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      title: const Text(
        "Error!",
        style: TextStyle(
          color: Colors.red, // Change the text color
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "OK",
            style: TextStyle(
              color: Colors.blue, // Change the button text color
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );

  });
}