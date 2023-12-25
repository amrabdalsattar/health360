import 'package:easy_localization/easy_localization.dart';
import 'package:health360/data/models/meals_model.dart';
import 'package:health360/ui/screens/count_down_screen/count_down.dart';
import 'package:health360/utils/app_asset.dart';
import 'package:health360/utils/app_color.dart';
import '../models/details_model.dart';
import '../models/exercise_model.dart';

abstract class ListOfNeeds {
  static final List<ExerciseDM> exercises = [
    ExerciseDM(AppAsset.pullUp, "pullUp".tr(), "8 ${"minuets".tr()}",
        "3 ${"rounds".tr()}", "strength".tr(), AppColor.liteGreen),
    ExerciseDM(AppAsset.pushUp, "pushUp".tr(), "6 ${"minuets".tr()}",
        "2 ${"rounds".tr()}", "strength".tr(), AppColor.liteGreen),
    ExerciseDM(AppAsset.sitUp, "sitUp".tr(), "10 ${"minuets".tr()}",
        "4 ${"rounds".tr()}", "muscles".tr(), AppColor.yellow),
    ExerciseDM(AppAsset.biceps, "bicepsCurl".tr(), "10 ${"minuets".tr()}",
        "3 ${"rounds".tr()}", "muscles".tr(), AppColor.yellow),
  ];

  static final List<MealsDM> breakfastMeals = [
    MealsDM(
        calories: "193",
        imagePath: AppAsset.shakshuka,
        mealTitle: "shakshuka".tr()),
    MealsDM(
        calories: "584",
        imagePath: AppAsset.boiledEggs,
        mealTitle: "boiledEggsMeal".tr()),
  ];
  static final List<DetailsDM> breakfastDetails = [
    DetailsDM(
      description: "shakshukaIngredients".tr(),
    ),
    DetailsDM(
      description: "boiledEggsIngredients".tr(),
    ),
  ];

  static final List<MealsDM> lunchMeals = [
    MealsDM(
        calories: "900",
        imagePath: AppAsset.grilledChicken,
        mealTitle: "grilledChickenMeal".tr()),
    MealsDM(
        calories: "1183",
        imagePath: AppAsset.steak,
        mealTitle: "steakMeal".tr()),
  ];
  static final List<DetailsDM> lunchDetails = [
    DetailsDM(
      description: "grilledChickenIngredients".tr(),
    ),
    DetailsDM(
      description: "steakAndPotatoesIngredients".tr(),
    ),
  ];

  static final List<MealsDM> dinnerMeals = [
    MealsDM(
        calories: "325",
        imagePath: AppAsset.mashedPotatoes,
        mealTitle: "mashedPotatoesMeal".tr()),
    MealsDM(
        calories: "600",
        imagePath: AppAsset.fruitSalad,
        mealTitle: "fruitSaladMeal".tr()),
  ];
  static final List<DetailsDM> dinnerDetails = [
    DetailsDM(
      description: "mashedPotatoesIngredients".tr(),
    ),
    DetailsDM(
      description: "fruitSaladIngredients".tr(),
    ),
  ];

  static final List<MealsDM> snackMeals = [
    MealsDM(
        calories: "303",
        imagePath: AppAsset.bananaSmoothie,
        mealTitle: "bananaSmoothieMeal".tr()),
    MealsDM(
        calories: "176",
        imagePath: AppAsset.sweetPotatoes,
        mealTitle: "sweetPotatoesMeal".tr()),
  ];
  static final List<DetailsDM> snackDetails = [
    DetailsDM(
      description: "bananaSmoothieIngredients".tr(),
    ),
    DetailsDM(
      description: "sweetPotatoesIngredients".tr(),
    ),
  ];

  static final List<DetailsDM> details = [
    DetailsDM(
        imagePath: AppAsset.pullUpFV,
        description: "pullUpDescription".tr(),
        route: ExerciseCountDown(title: "pullUp".tr())),
    DetailsDM(
        imagePath: AppAsset.pushUpFV,
        description: "pushUpDescription".tr(),
        route: ExerciseCountDown(title: "pushUp".tr())),
    DetailsDM(
        imagePath: AppAsset.sitUpFV,
        description: "sitUpDescription".tr(),
        route: ExerciseCountDown(title: "sitUp".tr())),
    DetailsDM(
        imagePath: AppAsset.bicepsFV,
        description: "bicepsCurlDescription".tr(),
        route: ExerciseCountDown(title: "bicepsCurl".tr())),
  ];

  static final List<ExerciseDM> spiritualPractices = [
    ExerciseDM(AppAsset.meditation, "meditation".tr(), "15 ${"minuet".tr()}", "",
        "spiritual".tr(), AppColor.purple),
    ExerciseDM(AppAsset.yoga, "yoga".tr(), "15 ${"minuet".tr()}", "", "spiritual".tr(),
        AppColor.purple),
    ExerciseDM(AppAsset.breathWork, "breathWork".tr(), "7 ${"minuets".tr()}", "",
        "spiritual".tr(), AppColor.purple),
  ];

  static final List<DetailsDM> spiritualPracticesDetails = [
    DetailsDM(
        imagePath: AppAsset.meditationFV,
        description: "meditationDescription".tr(),
        route: ExerciseCountDown(
          title: "meditation".tr(),
          duration: 15,
        )),
    DetailsDM(
        imagePath: AppAsset.yogaFV,
        description: "yogaDescription".tr(),
        route: ExerciseCountDown(
          title: "yoga".tr(),
          duration: 15,
        )),
    DetailsDM(
        imagePath: AppAsset.breathWorkFV,
        description: "breathworkDescription".tr(),
        route: ExerciseCountDown(
          title: "breathWork".tr(),
          duration: 7,
          isBreathwork: true,
        )),
  ];
}
