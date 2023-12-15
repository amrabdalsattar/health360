import 'package:flutter/material.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_color.dart';

class WeightAndAge extends StatelessWidget {
  final String type;
  final int age;
  final int weight;

  const WeightAndAge(
      {super.key, required this.type, required this.age, required this.weight});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.primary, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == "Age" ? "Age" : "Weight",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == "Age" ? "$age" : "$weight",
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: AppColor.black,
                  heroTag: type == "Age" ? "age--" : "weight--",
                  onPressed: () {
                    
                    type == "Age" ? provider.decrementAge():
                    provider.decrementWeight();
                    
                  },
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  backgroundColor: AppColor.grey,
                  heroTag: type == "Age" ? "age++" : "weight++",
                  onPressed: () {
                    type == "Age" ? provider.incrementAge() :
                    provider.incrementWeight();
                  },
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
