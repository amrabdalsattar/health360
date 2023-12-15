import 'package:flutter/material.dart';

class CaloriesData extends StatelessWidget {
  final String activeStatus;
  final String calories;

  const CaloriesData(
      {super.key, required this.activeStatus, required this.calories});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(activeStatus),
        Text(calories, maxLines: 3,),
      ],
    );
  }
}
