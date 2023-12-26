import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/data/data_constants/list_of_app_needs.dart';

import 'home_tab_widgets/exercise/exercise_components/exercise.dart';
import 'home_tab_widgets/slider/slider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// The Articles
            const NewsSlider(),
            /// The Spiritual exercises
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text("spiritualPractice".tr(),
                    style: Theme.of(context).textTheme.headlineLarge?.
                    copyWith(fontWeight: FontWeight.w500, fontSize: 20))),

            /// ListView.separated to add dividers between exercises
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ListOfNeeds.spiritualPractices.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => Exercise(
                exerciseDM: ListOfNeeds.spiritualPractices[index],
                detailsDM: ListOfNeeds.spiritualPracticesDetails[index],
                isExercise: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
