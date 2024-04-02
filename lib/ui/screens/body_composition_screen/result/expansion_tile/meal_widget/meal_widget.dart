import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/data/models/details_model.dart';
import 'package:health360/data/models/meals_model.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'meal_dialog.dart';

class MealWidget extends StatelessWidget {
  final MealsDM mealsDM;
  final DetailsDM detailsDM;

  const MealWidget({super.key, required this.mealsDM, required this.detailsDM});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return InkWell(
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.midGrey),
              borderRadius: BorderRadius.circular(36),
            ),
            height: 70,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        mealsDM.imagePath,
                        fit: BoxFit.cover,
                      )),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Text(
                                  mealsDM.mealTitle,
                                  style: const TextStyle(fontSize: 18),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: provider.appMode == ThemeMode.light
                                          ? AppColor.primary
                                          : AppColor.darkAccent,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            mealsDM.calories,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: AppColor.white),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "kcal".tr(),
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: AppColor.black),
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => MealDialog(
                    detailsDM: detailsDM,
                    title: mealsDM.mealTitle,
                  ));
        });
  }
}
