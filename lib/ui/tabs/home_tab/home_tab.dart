import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/data/data_constants/list_of_app_needs.dart';

import 'home_tab_widgets/exercise/exercise_components/exercise.dart';
import 'home_tab_widgets/slider/slider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const NewsSlider(),
            Container(
                margin: EdgeInsets.symmetric(vertical: 18.h),
                child: Text("spiritualPractice".tr(),
                    style: Theme.of(context).textTheme.headlineLarge?.
                    copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp))),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ListOfNeeds.spiritualPractices.length,
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
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
