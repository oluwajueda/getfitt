// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getfitts/screens/ExerciseScreen.dart';

class ExerciseInformation extends StatefulWidget {
  const ExerciseInformation({super.key});

  @override
  State<ExerciseInformation> createState() => _ExerciseInformationState();
}

class _ExerciseInformationState extends State<ExerciseInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExerciseScreen()))
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
              child: Text(
                "Read before you start",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Read below tips on the guidelines and benefits of the exercises you are about to start",
              style:
                  TextStyle(fontSize: 14, color: Color.fromRGBO(85, 85, 85, 1)),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Row(children: <Widget>[
                  Container(
                    child: Image.asset('assets/images/mark.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Text(
                      "Rest whenever you feel tired",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                          fontSize: 16),
                    ),
                  )
                ])
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(children: <Widget>[
                  Container(
                    child: Image.asset('assets/images/mark.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Text(
                      "Don't over push yourself",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                          fontSize: 16),
                    ),
                  )
                ])
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(children: <Widget>[
                  Container(
                    child: Image.asset('assets/images/mark.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Text(
                      "Stop when you feel dizzy",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                          fontSize: 16),
                    ),
                  )
                ])
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(children: <Widget>[
                  Container(
                    child: Image.asset('assets/images/mark.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Text(
                      "Make you have eaten before you start",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(51, 51, 51, 1),
                          fontSize: 16),
                    ),
                  )
                ])
              ],
            ),
            SizedBox(
              height: 300,
            ),
            SizedBox(
              width: 370,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExerciseScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(215, 60, 16, 1),
                  textStyle: TextStyle(color: Colors.white, fontSize: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.transparent)),
                  padding: EdgeInsets.all(18),
                ),
                child: Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
