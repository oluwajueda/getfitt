// ignore_for_file: prefer_const_constructo, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:getfitts/screens/exercise-timer.dart';
import 'package:getfitts/screens/firstExplainer.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen>
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 20.19,
                            color: Color.fromRGBO(215, 60, 16, 1)),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 20.19, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 20.19, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "4",
                        style: TextStyle(fontSize: 20.19, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 20.19, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "6",
                        style: TextStyle(fontSize: 20.19, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(height: 1, width: 25, color: Colors.black),
                  Container(
                    width: 40.38,
                    height: 40.38,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "7",
                        style: TextStyle(fontSize: 20.19, color: Colors.black),
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
                  child: firstExercise(context),
                ),
                Container(child: FirstExplainer()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget firstExercise(BuildContext context) {
  return Column(
    children: [
      Image.asset(
        "assets/images/exercise1.jpg",
        scale: 0.84,
      ),
      SizedBox(
        height: 25,
      ),
      Text(
        "Warm up",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: 15,
      ),
      Expanded(child: ExerciseTimer()),
    ],
  );
}
