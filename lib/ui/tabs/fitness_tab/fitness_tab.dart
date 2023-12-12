import 'package:flutter/material.dart';

import '../../../data/data_constants/list_of_app_needs.dart';
import '../home_tab/home_tab_widgets/exercise/exercise_components/exercise.dart';

class FitnessTab extends StatelessWidget {
  const FitnessTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: const Text("Recommended Exercises",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
            // Use ListView.separated to add dividers between exercises
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ListOfNeeds.exercises.length,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) => Exercise(
                exerciseDM: ListOfNeeds.exercises[index],
                detailsDM: ListOfNeeds.details[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
