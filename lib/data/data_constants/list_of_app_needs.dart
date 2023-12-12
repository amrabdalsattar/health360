import 'package:health360/ui/screens/count_down_screen/count_down.dart';
import 'package:health360/utils/app_asset.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/constants.dart';

import '../models/details_model.dart';
import '../models/exercise_model.dart';

abstract class ListOfNeeds{
  static final List<ExerciseDM> exercises = [
    ExerciseDM(AppAsset.pullUp,
        "Pull Up",
        "8 minuets",
        "3 Rounds",
        "Strength",
        AppColor.liteGreen
    ),
    ExerciseDM(AppAsset.pushUp,
        "Push Up",
        "6 minuets",
        "2 Rounds",
        "Strength",
        AppColor.liteGreen
    ),
    ExerciseDM(AppAsset.sitUp,
        "Sit Up",
        "10 minuets",
        "4 Rounds",
        "Muscles",
        AppColor.yellow
    ),
    ExerciseDM(AppAsset.biceps,
        "Biceps curl",
        "10 minuets",
        "3 Rounds",
        "Muscles",
        AppColor.yellow
    ),

  ];

  static final List<DetailsDM> details = [
    DetailsDM(imagePath: AppAsset.pullUpFV,
        description: Constant.pullUpDescription,
        route: ExerciseCountDown(title: "Pull Up")),

    DetailsDM(imagePath: AppAsset.pushUpFV,
        description: Constant.pushUpDescription,
        route: ExerciseCountDown(title: "Push Up")),

    DetailsDM(imagePath: AppAsset.sitUpFV,
        description: Constant.sitUpDescription,
        route: ExerciseCountDown(title: "Sit Up")),

    DetailsDM(imagePath: AppAsset.bicepsFV,
        description: Constant.bicepsCurlDescription,
        route: ExerciseCountDown(title: "Biceps curl")),





  ];

  static final List<ExerciseDM> spiritualPractices = [
    ExerciseDM(AppAsset.meditation, "Meditation", "15 Minuets", "", "Spiritual", AppColor.purple),
    ExerciseDM(AppAsset.yoga, "Yoga", "15 Minuets", "", "Spiritual", AppColor.purple),
    ExerciseDM(AppAsset.breathWork, "Breath-work", "7 Minuets", "", "Spiritual", AppColor.purple),
  ];

  static final List<DetailsDM> spiritualPracticesDetails = [
    DetailsDM(imagePath: AppAsset.meditationFV,
        description: Constant.meditationDescription,
        route: const ExerciseCountDown(title: "Meditation", duration: 15,)),
    DetailsDM(imagePath: AppAsset.yogaFV,
        description: Constant.yogaDescription,
        route: const ExerciseCountDown(title: "Yoga", duration: 15,)),
    DetailsDM(imagePath: AppAsset.breathWorkFV,
        description: Constant.breathworkDescription,
        route: const ExerciseCountDown(title: "Breath-work", duration: 7, isBreathwork: true,)),
  ];
}