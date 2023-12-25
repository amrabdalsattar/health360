import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health360/ui/screens/body_composition_screen/components/body_composition_app_bar.dart';
import 'package:health360/ui/screens/body_composition_screen/components/calculate_button.dart';
import 'package:health360/ui/screens/body_composition_screen/components/gender.dart';
import 'package:health360/ui/screens/body_composition_screen/components/height_slider.dart';
import 'package:health360/ui/screens/body_composition_screen/components/weight_and_age.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_color.dart';

class BodyCompositionScreen extends StatelessWidget {
  static const String routeName = "body composition";

  const BodyCompositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColor.black,
        systemNavigationBarColor: AppColor.black));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: BodyCompositionAppBar(
          title: "bodyComposition".tr(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Gender(type: "male"),
                      SizedBox(
                        width: 10,
                      ),
                      Gender(type: "female")
                    ],
                  ),
                ),
              ),
              const HeightSlider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      WeightAndAge(
                          type: "Weight",
                          age: provider.age,
                          weight: provider.weight),
                      const SizedBox(
                        width: 10,
                      ),
                      WeightAndAge(
                          type: "Age",
                          age: provider.age,
                          weight: provider.weight)
                    ],
                  ),
                ),
              ),
              const CalculateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
