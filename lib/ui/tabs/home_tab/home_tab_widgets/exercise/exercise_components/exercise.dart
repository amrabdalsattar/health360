import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health360/data/models/details_model.dart';
import 'package:health360/data/models/exercise_model.dart';
import 'package:health360/utils/app_color.dart';

import 'exercise_dialog.dart';

class Exercise extends StatelessWidget {
  final ExerciseDM exerciseDM;
  final DetailsDM detailsDM;
  final bool isExercise;

  const Exercise({super.key, required this.exerciseDM,
    required this.detailsDM, this.isExercise = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.midGrey),
            borderRadius: BorderRadius.circular(36),
          ),
          height: 110,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      exerciseDM.imagePath,
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exerciseDM.exerciseTitle,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: exerciseDM.exerciseTypeColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(exerciseDM.exerciseType)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.clock_fill,
                            color: AppColor.midGrey,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(exerciseDM.duration),
                          const SizedBox(
                            width: 16,
                          ),
                          Visibility(
                            visible: isExercise,
                            child: const Icon(
                              Icons.fitness_center,
                              color: AppColor.midGrey,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Expanded(
                              child: Text(exerciseDM.level,
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
            title: exerciseDM.exerciseTitle,)
        );
      },
    );
  }
}
