// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/widgets/round-button.dart';

class ExerciseTimer extends StatefulWidget {
  const ExerciseTimer({Key? key}) : super(key: key);

  @override
  State<ExerciseTimer> createState() => _ExerciseTimerState();
}

class _ExerciseTimerState extends State<ExerciseTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 18000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "prev",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 12),
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Text(
                      "00.00",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        RoundedButton(icon: Icons.play_arrow),
        SizedBox(
          width: 15,
        ),
        Text(
          "Next",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        )
      ],
    );
  }
}
