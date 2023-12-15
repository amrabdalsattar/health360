import 'package:flutter/material.dart';
import 'package:health360/data/models/meals_model.dart';
import 'package:health360/utils/app_asset.dart';
import 'package:health360/utils/app_color.dart';


class MealWidget extends StatelessWidget {
  final MealsDM mealsDM;
  const MealWidget({super.key, required this.mealsDM});

  @override
  Widget build(BuildContext context) {
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                                style: TextStyle(fontSize: 18),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        mealsDM.calories,
                                        style: TextStyle(fontSize: 14, color: AppColor.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Text(
                                        "kcal",
                                        style: TextStyle(fontSize: 12, color: AppColor.black),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
    );
  }
}
