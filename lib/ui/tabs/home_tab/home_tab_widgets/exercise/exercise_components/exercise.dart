import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/data/models/details_model.dart';
import 'package:health360/data/models/exercise_model.dart';
import 'package:health360/utils/app_color.dart';
import 'exercise_dialog.dart';

class Exercise extends StatelessWidget {
  final ExerciseDM exerciseDM;
  final DetailsDM detailsDM;
  final bool isExercise;

  const Exercise(
      {super.key,
      required this.exerciseDM,
      required this.detailsDM,
      this.isExercise = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(36),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.midGrey),
            borderRadius: BorderRadius.circular(36),
          ),
          height: 90.h,
          child: Row(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                padding: EdgeInsets.all(6.w),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      exerciseDM.imagePath,
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                child: Container(
                  margin:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exerciseDM.exerciseTitle,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          Container(
                              padding: EdgeInsets.all(6.w),
                              decoration: BoxDecoration(
                                  color: exerciseDM.exerciseTypeColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                exerciseDM.exerciseType,
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 11.sp
                                ),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.clock_fill,
                            color: AppColor.midGrey,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            exerciseDM.duration,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Visibility(
                            visible: isExercise,
                            child: const Icon(
                              Icons.fitness_center,
                              color: AppColor.midGrey,
                            ),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Expanded(
                              child: Text(exerciseDM.level,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => ExerciseDialog(
                  detailsDM: detailsDM,
                  title: exerciseDM.exerciseTitle,
                ));
      },
    );
  }
}
