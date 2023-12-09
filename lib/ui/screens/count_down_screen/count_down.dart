import 'package:flutter/material.dart';
import 'package:health360/ui/screens/count_down_screen/count_down_components/button.dart';
import 'package:health360/utils/app_color.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ExerciseCountDown extends StatefulWidget {
  final String title;

  const ExerciseCountDown({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  ExerciseCountDownState createState() => ExerciseCountDownState();
}

class ExerciseCountDownState extends State<ExerciseCountDown> {
  // Controller
  final CountdownController _controller = CountdownController();

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Countdown(
            controller: _controller,
            seconds: 1 * 60,
            build: (_, double time) {
              final minutes = ((time / 60) % 60).floor();
              final seconds = (time % 60).floor();
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
          SizedBox(
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
                  _controller.restart();
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
