// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/ExerciseScreen.dart';
import 'package:getfitts/screens/exercise-timer.dart';

class SecondExerciseScreen extends StatefulWidget {
  const SecondExerciseScreen({super.key});

  @override
  State<SecondExerciseScreen> createState() => _SecondExerciseScreenState();
}

class _SecondExerciseScreenState extends State<SecondExerciseScreen>
    with TickerProviderStateMixin {
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
            height: 60,
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
                  child: secondExercise(context),
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

Widget secondExercise(BuildContext context) {
  return Column(
    children: [
      Image.asset(
        "assets/images/exercise1.jpg",
        scale: 0.84,
      ),
      SizedBox(
        height: 25,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Butt Kicks",
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
      Expanded(child: ExerciseTimer()),
    ],
  );
}
