import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/utils/app_color.dart';

void showLoading(BuildContext context){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (_){
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          content: Row(
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

void showErrorDialog(BuildContext context, String message){
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
        message,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
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