import 'package:health360/data/models/meals_model.dart';
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

  static final List<MealsDM> breakfastMeals = [
    MealsDM(calories: "193",
        imagePath: AppAsset.shakshuka,
        mealTitle: "Shakshuka"),
    MealsDM(calories: "584",
        imagePath: AppAsset.boiledEggs,
        mealTitle: "Boiled Eggs & Toast"),
  ];

  static final List<MealsDM> lunchMeals = [
    MealsDM(calories: "900",
        imagePath: AppAsset.grilledChicken,
        mealTitle: "Grilled Chicken & Salad & Toast"),
    MealsDM(calories: "1183",
        imagePath: AppAsset.steak,
        mealTitle: "Steak & Potatoes"),
  ];

  static final List<MealsDM> dinnerMeals = [
    MealsDM(calories: "325",
        imagePath: AppAsset.mashedPotatoes,
        mealTitle: "Mashed Potatoes & Hot Pepper"),
    MealsDM(calories: "600",
        imagePath: AppAsset.fruitSalad,
        mealTitle: "Fruit Salad & Yogurt"),
  ];

  static final List<MealsDM> snackMeals = [
    MealsDM(calories: "303",
        imagePath: AppAsset.bananaSmoothie,
        mealTitle: "Banana Smoothie & Apple"),
    MealsDM(calories: "176",
        imagePath: AppAsset.sweetPotatoes,
        mealTitle: "Sweet Potatoes & Honey"),
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
        route: const ExerciseCountDown(title: "Sit Up")),

    DetailsDM(imagePath: AppAsset.bicepsFV,
        description: Constant.bicepsCurlDescription,
        route: const ExerciseCountDown(title: "Biceps curl")),





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