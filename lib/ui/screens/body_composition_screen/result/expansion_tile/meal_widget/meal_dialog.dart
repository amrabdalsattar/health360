import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health360/data/models/details_model.dart';


class MealDialog extends StatefulWidget {
  final DetailsDM detailsDM;
  final String title;

  const MealDialog(
      {super.key, required this.detailsDM, required this.title});

  @override
  MealDialogState createState() => MealDialogState();
}

class MealDialogState extends State<MealDialog>
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
            title: Text(context.locale == const Locale("ar") ?
            "${"ingredients".tr()} ${widget.title}" : "${widget.title} ${"ingredients".tr()}",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            content: Text(widget.detailsDM.description,
                style: Theme.of(context).textTheme.bodyMedium),
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
