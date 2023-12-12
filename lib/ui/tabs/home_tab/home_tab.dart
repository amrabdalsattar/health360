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
            const NewsSlider(),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text("Spiritual practice",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
            // Use ListView.separated to add dividers between exercises
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
