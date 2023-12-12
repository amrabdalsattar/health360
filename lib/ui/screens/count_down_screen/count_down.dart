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
  // Controller
  final CountdownController _controller = CountdownController();
  late SettingsProvider provider;

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
          style: TextStyle(color: AppColor.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
              visible: widget.isBreathwork,
              child: Text(provider.breathworkStatus, style:
              const TextStyle(fontSize: 25,
                  color: AppColor.secondary,
                  fontWeight: FontWeight.bold),)),
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
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: AppColor.green,
                ),
              );
            },
            interval: const Duration(seconds: 1),
            onFinished: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Timer is done!'),
                ),
              );
              // You can add any additional logic here if needed
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CountDownButton(
                title: "Start",
                onPressed: () {
                  _controller.start();
                },
              ),
              CountDownButton(
                title: "Pause",
                onPressed: () {
                  _controller.pause();
                },
              ),
              CountDownButton(
                title: "Resume",
                onPressed: () {
                  _controller.resume();
                },
              ),
              CountDownButton(
                title: "Restart",
                onPressed: () {
                  provider.changeBreathworkStatus("Inhale");
                  _controller.restart();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
  void inhaleAndExhaleAlgorithm(int seconds, int minutes){
    if ((seconds % 5) - 1 == 0) {
      Future.delayed(const Duration(seconds: 1), () {
        if (provider.breathworkStatus == "Inhale" &&
            minutes != widget.duration) {
          provider.changeBreathworkStatus("Exhale");
        } else if (minutes == 0 && seconds == 0) {
          provider.changeBreathworkStatus(provider.breathworkStatus);
        } else {
          provider.changeBreathworkStatus("Inhale");
        }
      });
    }
  }
}
