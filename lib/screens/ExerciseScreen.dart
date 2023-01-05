// ignore_for_file: prefer_const_constructo
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final controller = PageController();
  final List<bool> isSelected = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page view'),
          actions: [
            IconButton(
                onPressed: () {
                  controller.animateToPage(0,
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
                icon: Icon(Icons.keyboard_arrow_left)),
            IconButton(
                onPressed: () {
                  controller.animateToPage(1,
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                },
                icon: Icon(Icons.keyboard_arrow_right)),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ToggleButtons(
                fillColor: Color.fromRGBO(215, 60, 16, 1),
                selectedColor: Colors.white,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Exercise',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Explainer',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
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
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
