// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;

  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CircularPercentIndicator(
            radius: 80.0,
            circularStrokeCap: CircularStrokeCap.round,
            percent: 0.0 / 100,
            animation: true,
            animateFromLastPercent: true,
            lineWidth: 8.0,
            backgroundColor: Color.fromRGBO(245, 245, 245, 1),
            progressColor: Color.fromRGBO(215, 60, 16, 1),
            center: Text(
              "75%",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 6, 50, 6),
            child: Text(
              'You have completed 75% of your exercise tody, 25 Monday, Complete now',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 16,
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
                  padding:
                      EdgeInsets.only(left: index == 0 ? 16.0 : 0.0, right: 16),
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
            height: 14,
          ),
          Text("Daily task"),
          Container(
            height: 63,
            width: 372,
            decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
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
                Text('Record your vitals')
              ],
            ),
          ),
          Container(
            height: 372,
            width: 372,
            decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
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
                Text('Record your vitals')
              ],
            ),
          )
        ],
      ),
    );
  }
}
