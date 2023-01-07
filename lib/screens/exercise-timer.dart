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
  bool showWidget = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  bool notBegin = true;
  String initialTime = '05.00';
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 300),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Row(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 26, horizontal: 12),
                  child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) => Text(
                            notBegin ? initialTime : countText,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        isPlaying = false;
                        notBegin = false;
                        showWidget = true;
                      });
                    } else {
                      controller.reverse(
                          from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isPlaying = true;
                        notBegin = false;
                        showWidget = false;
                      });
                    }
                  },
                  child: RoundedButton(
                      icon:
                          isPlaying == true ? Icons.pause : Icons.play_arrow)),
              SizedBox(
                width: 15,
              ),
              Text(
                "Next",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        showWidget
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: ElevatedButton(
                      onPressed: (() {
                        controller.reset();
                        setState(() {
                          isPlaying = false;
                        });
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        "Restart",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 60,
                    child: ElevatedButton(
                      onPressed: (() {}),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        "Quit",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 80,
                    child: ElevatedButton(
                      onPressed: (() {
                        controller.reverse(
                            from:
                                controller.value == 0 ? 1.0 : controller.value);
                        setState(() {
                          isPlaying = true;
                        });
                      }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.black)),
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
                      child: Text(
                        "Resume",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
