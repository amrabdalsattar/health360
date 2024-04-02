import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/screens/body_composition_screen/components/body_composition_app_bar.dart';
import 'package:health360/ui/screens/body_composition_screen/result/components/bmi_widget.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/constants.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'expansion_tile/meal_expansion_tile.dart';

class BodyResult extends StatelessWidget {
  static const String routeName = "result";

  final double bMIResult;

  String get resultPhrase {
    String resultText = '';
    if (bMIResult >= 30) {
      resultText = "obese".tr();
    } else if (bMIResult >= 25 && bMIResult < 30) {
      resultText = "overweight".tr();
    } else if (bMIResult >= 18.5 && bMIResult <= 24.9) {
      resultText = "normal".tr();
    } else {
      resultText = "thin".tr();
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: BodyCompositionAppBar(
          title: "result".tr(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              sizedBox,
              Row(
                children: [
                  Expanded(
                      child: BMIWidget(
                          bMIResult: bMIResult.toStringAsFixed(1),
                          title: "bodyMassIndex".tr())),
                  Expanded(
                      child: BMIWidget(
                          bMIResult: resultPhrase, title: "rangeOf".tr())),
                ],
              ),
              sizedBox,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.liteGrey,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "caloriesLimit".tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    span("sedentary".tr(), 1.2, context),
                    sizedBox,
                    span("lightlyActive".tr(), 1.375, context),
                    sizedBox,
                    span("moderatelyActive".tr(), 1.55, context),
                    sizedBox,
                    span("veryActive".tr(), 1.725, context),
                    sizedBox,
                    span("extraActive".tr(), 1.9, context)
                  ],
                ),
              ),
              sizedBox,
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text("suggestedMeals",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500))
                      .tr()),
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
                  "caution",
                  style: TextStyle(
                      color: AppColor.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ).tr(),
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

  Widget span(String activeStatus, double tdee, BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$activeStatus\n",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.darkGrey),
          ),
          TextSpan(
            text: (bMRCalculation(provider.age, provider.weight,
                        provider.heightValue, provider.isMale) *
                    tdee)
                .toStringAsFixed(1),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: provider.appMode == ThemeMode.light
                  ? Colors.blue
                  : AppColor.darkAccent, // Set your desired color here
            ),
          ),
        ],
      ),
    );
  }
}
