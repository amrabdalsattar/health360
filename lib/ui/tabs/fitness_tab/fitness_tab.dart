import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/ui/tabs/fitness_tab/components/body_composition_navigator.dart';

import '../../../data/data_constants/list_of_app_needs.dart';
import '../home_tab/home_tab_widgets/exercise/exercise_components/exercise.dart';

class FitnessTab extends StatelessWidget {
  const FitnessTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BodyCompositionNavigator(),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                child: Text("recommendedExercises",
                    style: Theme.of(context).textTheme.headlineLarge
                        ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500)).tr()
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: ListOfNeeds.exercises.length,
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
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