import 'package:flutter/material.dart';
import 'package:health360/ui/screens/body_composition_screen/components/body_composition_app_bar.dart';
import 'package:health360/ui/screens/body_composition_screen/result/components/bmi_widget.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/constants.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'expantion_tile/meal_expansion_tile.dart';

class BodyResult extends StatelessWidget {
  static const String routeName = "result";

  final double bMIResult;

  String get resultPhrase {
    String resultText = '';
    if (bMIResult >= 30) {
      resultText = "Obese";
    } else if (bMIResult >= 25 && bMIResult < 30) {
      resultText = "Overweight";
    } else if (bMIResult >= 18.5 && bMIResult <= 24.9) {
      resultText = "Normal";
    } else {
      resultText = "Thin";
    }
    return resultText;
  }

  late SettingsProvider provider;

  BodyResult({
    super.key,
    this.bMIResult = 18.5,
  });

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    Widget sizedBox = const SizedBox(
      height: 10,
    );
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: BodyCompositionAppBar(
          title: "Result",
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              sizedBox,
              Row(

                children: [
                  Expanded(child: BMIWidget(bMIResult: bMIResult.toStringAsFixed(1), title: "BMI")),
                  Expanded(child: BMIWidget(bMIResult: resultPhrase, title: "Range of")),
                ],
              ),
              sizedBox,
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.liteGrey,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Calories Limit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    span("Sedentary (little or no exercise):", 1.2),
                    sizedBox,
                    span(
                        "Lightly active (light exercise/sports 1-3 days/week):",
                        1.375),
                    sizedBox,
                    span(
                        "Moderately active (moderate exercise/sports 3-5 days/week):",
                        1.55),
                    sizedBox,
                    span("Very active (hard exercise/sports 6-7 days a week):",
                        1.725),
                    sizedBox,
                    span(
                        "Extra active (very hard exercise/sports & physical job or 2x training):",
                        1.9)
                  ],
                ),
              ),
              sizedBox,
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text("Suggested Meals",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
              sizedBox,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Constant.meals.length,
                itemBuilder: (context, index) =>
                    MealExpansionTile(index: index),
              ),
              sizedBox,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.liteGrey,
                    borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColor.midGrey)),
                child: const Text(
                  "CAUTION! ${Constant.messageToUser}",
                  style: TextStyle(
                      color: AppColor.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  double bMRCalculation(int age, int weight, double height, bool isMale) {
    if (isMale) {
      return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
  }

  Widget span(String activeStatus, double tdee) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$activeStatus\n",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
          ),
          TextSpan(
            text: (bMRCalculation(provider.age, provider.weight,
                        provider.heightValue, provider.isMale) *
                    tdee)
                .toStringAsFixed(1),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue, // Set your desired color here
            ),
          ),
        ],
      ),
    );
  }
}
