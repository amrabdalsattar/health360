import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/screens/count_down_screen/count_down_components/button.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ExerciseCountDown extends StatefulWidget {
  final String title;
  final int duration;
  final bool isBreathwork;

  const ExerciseCountDown({
    Key? key,
    required this.title,
    this.duration = 1,
    this.isBreathwork = false,
  }) : super(key: key);

  @override
  ExerciseCountDownState createState() => ExerciseCountDownState();
}

class ExerciseCountDownState extends State<ExerciseCountDown> {
  final CountdownController _controller = CountdownController();
  late SettingsProvider provider;
  int duration = 1;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColor.transparent,
        elevation: 0,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            provider.changeBreathworkStatus("inhale".tr());
          },
          icon: Icon(Icons.arrow_back, color: provider.appMode == ThemeMode.light?
          AppColor.black : AppColor.darkAccent,),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
              visible: widget.isBreathwork,
              child: Text(
                provider.breathworkStatus.tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              )),
          const SizedBox(
            height: 20,
          ),
          Countdown(
            controller: _controller,
            seconds: widget.duration * 60,
            build: (_, double time) {
              final minutes = ((time / 60) % 60).floor();
              final seconds = (time % 60).floor();

              inhaleAndExhaleAlgorithm(seconds, minutes);

              return Text(
                '$minutes:${seconds < 10 ? '0$seconds' : seconds}',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 80,
                    color: provider.appMode == ThemeMode.light?
                    AppColor.green : AppColor.darkAccent),
              );
            },
            interval: const Duration(seconds: 1),
            onFinished: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Timer is done!'),
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CountDownButton(
                title: "start".tr(),
                onPressed: () {
                  duration = 1;
                  _controller.start();
                },
                color: AppColor.darkPrimary,
              ),
              CountDownButton(
                title: "pause".tr(),
                onPressed: () {
                  duration = 600;
                  _controller.pause();
                },
                  color: AppColor.darkPrimary
              ),
              CountDownButton(
                title: "resume".tr(),
                onPressed: () {
                  duration = 1;
                  _controller.resume();
                },
                color: AppColor.darkPrimary,
              ),
              CountDownButton(
                title: "restart".tr(),
                onPressed: () {
                  duration = 1;
                  provider.changeBreathworkStatus("inhale".tr());
                  _controller.restart();
                },
                color: AppColor.darkPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void inhaleAndExhaleAlgorithm(int seconds, int minutes) {
    if ((seconds % 5) - 1 == 0) {
      Future.delayed(Duration(seconds: duration), () {
        if (provider.breathworkStatus.tr() == "inhale".tr() &&
            minutes != widget.duration) {
          provider.changeBreathworkStatus("exhale".tr());
        } else if (minutes == 0 && seconds == 0) {
          provider.changeBreathworkStatus(provider.breathworkStatus.tr());
        } else {
          provider.changeBreathworkStatus("inhale".tr());
        }
      });
    }
  }
}
