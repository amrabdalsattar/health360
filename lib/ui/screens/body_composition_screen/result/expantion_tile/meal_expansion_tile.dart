import 'package:flutter/material.dart';
import 'package:health360/data/data_constants/list_of_app_needs.dart';
import 'package:health360/ui/screens/body_composition_screen/result/expantion_tile/meal_widget/meal_widget.dart';
import 'package:health360/utils/app_color.dart';

import '../../../../../data/models/meals_model.dart';
import '../../../../../utils/constants.dart';

class MealExpansionTile extends StatelessWidget {
  final int index;

  const MealExpansionTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.midGrey),
        color: AppColor.white
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        collapsedIconColor: AppColor.primary,
        iconColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        title: Text(Constant.meals[index], style: const TextStyle(
            fontWeight: FontWeight.bold, color: AppColor.primary),),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mealGenerator().length,
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemBuilder: (context, index) => MealWidget(mealsDM: mealGenerator()[index],)),
          ),
        ],
      ),
    );
  }
  List<MealsDM> mealGenerator(){
    if(Constant.meals[index] == "Breakfast"){
      return ListOfNeeds.breakfastMeals;
    }else if(Constant.meals[index] == "Lunch"){
      return ListOfNeeds.lunchMeals;
    } else if(Constant.meals[index] == "Dinner"){
  return ListOfNeeds.dinnerMeals;
  }else{
    return ListOfNeeds.snackMeals;
  }
}
}
