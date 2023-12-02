import 'package:flutter/material.dart';
import 'package:health360/utils/app_color.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health 360"),
        backgroundColor: AppColor.secondary,
      ),
    );
  }
}
