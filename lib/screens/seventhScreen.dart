// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/ExerciseScreen.dart';

class SeventhScreen extends StatefulWidget {
  const SeventhScreen({super.key});

  @override
  State<SeventhScreen> createState() => _SeventhScreenState();
}

class _SeventhScreenState extends State<SeventhScreen> {
  final controller = PageController();
  final List<bool> isSelected = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExerciseScreen()))
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Row(
                children: [
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(215, 60, 16, 1), width: 1),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 20.19, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(215, 60, 16, 1), width: 1),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 20.19, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(215, 60, 16, 1),
                        ),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 20.19, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(215, 60, 16, 1),
                        ),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "4",
                        style: TextStyle(
                          fontSize: 20.19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(215, 60, 16, 1), width: 1),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 20.19, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(215, 60, 16, 1), width: 1),
                        color: Color.fromRGBO(215, 60, 16, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "6",
                        style: TextStyle(fontSize: 20.19, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(215, 60, 16, 1), width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "7",
                        style: TextStyle(
                            fontSize: 20.19,
                            color: Color.fromRGBO(215, 60, 16, 1)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              child: Container(
                padding: EdgeInsets.zero,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
                child: ToggleButtons(
                  fillColor: Color.fromRGBO(215, 60, 16, 1),
                  selectedColor: Colors.white,
                  color: Colors.black,
                  borderColor: Colors.transparent,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 8, 20, 8),
                      child: Text(
                        'Exercise',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 80, 8),
                      child: Text(
                        'Explainer',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                  constraints: BoxConstraints(
                      minWidth: (MediaQuery.of(context).size.width - 36) / 2),
                  onPressed: (int index) {
                    setState(() {
                      if (index == 1) {
                        controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      } else {
                        controller.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      }
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  child: thirdExercise(context),
                ),
                Container(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget thirdExercise(BuildContext context) {
  return Column(
    children: [
      Image.asset(
        "assets/images/exercise1.jpg",
        scale: 0.84,
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bend Leg Twist",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset("assets/images/help-circle.png")
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Expanded(
          child: Column(
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                          child: Text(
                        "X12",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 22.26),
                      ))),
                ),
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
          SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 360,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExerciseScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(215, 60, 16, 1),
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(color: Colors.transparent)),
                padding: EdgeInsets.all(18),
              ),
              child: Text("Mark as completed"),
            ),
          ),
        ],
      )),
    ],
  );
}
