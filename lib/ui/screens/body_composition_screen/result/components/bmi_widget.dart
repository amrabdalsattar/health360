import 'package:flutter/material.dart';
import 'package:health360/utils/app_color.dart';

class BMIWidget extends StatelessWidget {
  final String bMIResult;
  final String title;
  const BMIWidget({super.key, required this.bMIResult, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        color: AppColor.liteGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),),
          SizedBox(height: 10,),
          Text(bMIResult, style: TextStyle(fontSize: 20, color: AppColor.primary, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
