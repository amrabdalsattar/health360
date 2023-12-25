import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/shared_components/loading.dart';


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
              Text("loading".tr(), style: Theme.of(context).textTheme.bodyMedium,),
              const Spacer(),
              const LoadingWidget()
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
        "error".tr(),
        style: const TextStyle(
          color: Colors.red, // Change the text color
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "ok".tr(),
            style: const TextStyle(
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