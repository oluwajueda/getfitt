// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/Vitals.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int percent = 0;
  late Timer timer;

  _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 6000), (_) {
      setState(() {
        percent += 1;

        if (percent >= 100) {
          timer.cancel();
          percent = 100;
        }
      });
    });
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Container(
              height: 230,
              width: 372,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(dateNow),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 32),
                    child: Row(
                      children: [
                        Text(
                          "10 minutes",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromRGBO(10, 46, 54, 1)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "10 exercises",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromRGBO(10, 46, 54, 1)),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        CircularPercentIndicator(
                          radius: 13.0,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: percent / 100,
                          animation: true,
                          animateFromLastPercent: true,
                          lineWidth: 3.2,
                          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                          progressColor: Color.fromRGBO(215, 60, 16, 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 350,
                      height: 45,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color.fromRGBO(215, 60, 16, 1)),
                        child: GestureDetector(
                          onTap: _startTimer,
                          child: Text(
                            "Start now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      "Set Reminder",
                      style: TextStyle(
                          color: Color.fromRGBO(10, 46, 54, 1), fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
