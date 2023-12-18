import 'package:flutter/material.dart';
import 'package:health360/ui/tabs/fitness_tab/components/body_composition_navigator.dart';

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
            const BodyCompositionNavigator(),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text("Recommended Exercises",
                    style: Theme.of(context).textTheme.headlineLarge
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500))),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ListOfNeeds.exercises.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
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
