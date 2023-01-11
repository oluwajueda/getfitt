// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/provider/exerciseCounter.dart';
import 'package:getfitts/screens/ExerciseInformation.dart';
import 'package:getfitts/screens/Vitals.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class UnHealthy extends StatefulWidget {
  const UnHealthy({super.key});

  @override
  State<UnHealthy> createState() => _UnHealthyState();
}

class _UnHealthyState extends State<UnHealthy> {
  late Timer timer;

  _startTimer() {
    // setState(() {
    //   percent += 1;

    //   if (percent >= 100) {
    //     timer.cancel();
    //     percent = 100;
    //   }
    // });
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ExerciseInformation()));
  }

  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;

  DateTime today = DateTime.now();

  late var dateNow = DateFormat.yMMMd().format(today);

  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    final ExerciseCounter counter =
        Provider.of<ExerciseCounter>(context, listen: false);
    counter.increment();
    print("hello");
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<ExerciseCounter>(context, listen: false);

    final percent = counter.count;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            CircularPercentIndicator(
              radius: 85.0,
              circularStrokeCap: CircularStrokeCap.round,
              percent: percent / 100,
              animation: true,
              animateFromLastPercent: true,
              lineWidth: 10.0,
              backgroundColor: Color.fromRGBO(245, 245, 245, 1),
              progressColor: Color.fromRGBO(215, 60, 16, 1),
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$percent" "%",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Completed today")
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 6, 35, 6),
              child: Text(
                'You have completed $percent% of your exercise today, 25 Monday, Complete now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1), fontSize: 16),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(
                children: List.generate(lastDayOfMonth.day, (index) {
                  final currentDate =
                      lastDayOfMonth.add(Duration(days: index + 1));
                  final dayName = DateFormat('E').format(currentDate);
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 16.0 : 0.0, right: 16),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        selectedIndex = index;
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: selectedIndex == index ? 40.0 : 40,
                            width: selectedIndex == index ? 104 : 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? Color.fromRGBO(10, 46, 54, 1)
                                    : Colors.transparent,
                                borderRadius:
                                    BorderRadiusDirectional.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                selectedIndex == index
                                    ? Text(
                                        dayName,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black54,
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),

                          // const SizedBox(height: 8.0),
                          // Container(
                          //   height: 2.0,
                          //   width: 28.0,
                          //   color: selectedIndex == index
                          //       ? Colors.orange
                          //       : Colors.transparent,
                          // ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Daily task",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(51, 51, 51, 1)),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              height: 63,
              width: 372,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(215, 60, 16, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Vitals()));
                        },
                        child: Text(
                          'Record your vitals',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "You do not have any exercises available for you. You need to see a physician for a more specific line of treatment",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Review settings",
                    style: TextStyle(
                        color: Color.fromRGBO(215, 60, 16, 1), fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
