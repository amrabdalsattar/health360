import 'package:flutter/material.dart';
import 'package:health360/data/models/details_model.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/app_theme.dart';

class ExerciseDialog extends StatefulWidget {
  final DetailsDM detailsDM;
  final String title;

  const ExerciseDialog(
      {super.key, required this.detailsDM, required this.title});

  @override
  ExerciseDialogState createState() => ExerciseDialogState();
}

class ExerciseDialogState extends State<ExerciseDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            scrollable: true,
            title: Text(widget.title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18)),
            content: SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(widget.detailsDM.imagePath, height: 200),
                  Text(widget.detailsDM.description,
                      style: Theme.of(context).textTheme.bodyMedium),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(300, 30)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widget.detailsDM.route));
                    },
                    child: Text("Start",
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: AppColor.white)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
