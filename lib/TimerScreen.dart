// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TimerClockApp extends StatefulWidget {
  const TimerClockApp({super.key});

  @override
  State<TimerClockApp> createState() => _TimerClockAppState();
}

class _TimerClockAppState extends State<TimerClockApp> {
  double percent = 0.0;
  late Timer timer;

  _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        percent += 10;
        if (percent >= 100) {
          timer.cancel();
          percent = 0.0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // ignore: prefer_const_literals_to_create_immutables
                colors: [Color(0xff1542bf), Color(0xff51a8ff)],
                begin: FractionalOffset(0.5, 1))),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                "Timer Clock",
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            Expanded(
                child: CircularPercentIndicator(
              circularStrokeCap: CircularStrokeCap.round,
              percent: percent / 100,
              animation: true,
              animateFromLastPercent: true,
              radius: 250.0,
              lineWidth: 20.0,
              progressColor: Colors.white,
              center: Text(
                '$percent',
                style: TextStyle(color: Colors.white, fontSize: 80),
              ),
            )),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "Study Time",
                              style: TextStyle(fontSize: 30.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "$percent",
                              style: TextStyle(fontSize: 80.0),
                            )
                          ],
                        ))
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              "pause Time",
                              style: TextStyle(fontSize: 30.0),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "5",
                              style: TextStyle(fontSize: 80.0),
                            )
                          ],
                        ))
                      ],
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 28.0),
                      child: ElevatedButton(
                        onPressed: _startTimer,
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(100.0)))),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Start studying",
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
