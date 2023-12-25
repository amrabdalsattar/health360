import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/data/data_constants/list_of_app_needs.dart';
import 'package:health360/data/models/details_model.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/meals_model.dart';
import '../../../../../utils/constants.dart';
import 'meal_widget/meal_widget.dart';

class MealExpansionTile extends StatelessWidget {
  final int index;

  const MealExpansionTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.midGrey),
        color: provider.appMode == ThemeMode.light
            ? AppColor.white
            : AppColor.darkPrimary,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        collapsedIconColor: provider.appMode == ThemeMode.light
            ? AppColor.primary
            : AppColor.darkAccent,
        iconColor: provider.appMode == ThemeMode.light
            ? AppColor.primary
            : AppColor.darkAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          Constant.meals[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: provider.appMode == ThemeMode.light
                ? AppColor.primary
                : AppColor.darkAccent,
          ),
        ),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mealGenerator().length,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemBuilder: (context, index) => MealWidget(
                      mealsDM: mealGenerator()[index], detailsDM: detailsGenerator()[index],
                    )),
          ),
        ],
      ),
    );
  }

  List<MealsDM> mealGenerator() {
    if (Constant.meals[index] == "breakfast".tr()) {
      return ListOfNeeds.breakfastMeals;
    } else if (Constant.meals[index] == "lunch".tr()) {
      return ListOfNeeds.lunchMeals;
    } else if (Constant.meals[index] == "dinner".tr()) {
      return ListOfNeeds.dinnerMeals;
    } else {
      return ListOfNeeds.snackMeals;
    }
  }

  List<DetailsDM> detailsGenerator() {
    if (Constant.meals[index] == "breakfast".tr()) {
      return ListOfNeeds.breakfastDetails;
    } else if (Constant.meals[index] == "lunch".tr()) {
      return ListOfNeeds.lunchDetails;
    } else if (Constant.meals[index] == "dinner".tr()) {
      return ListOfNeeds.dinnerDetails;
    } else {
      return ListOfNeeds.snackDetails;
    }
  }
}
