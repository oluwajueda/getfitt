// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/Home.dart';

class VitalsSaved extends StatefulWidget {
  const VitalsSaved({super.key});

  @override
  State<VitalsSaved> createState() => _VitalsSavedState();
}

class _VitalsSavedState extends State<VitalsSaved> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/images/celebrate.png",
              ),
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 140,
                ),
                Image.asset(
                  'assets/images/rocket.png',
                  height: 189,
                  width: 235,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Vitals saved successfully",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              'We have successfully stored your vitals recorded for 3rd of December, 2022. You can review your vitals under settings page.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromRGBO(85, 85, 85, 1)),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            width: 370,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(215, 60, 16, 1)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text(
                "Start your exercise now",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 370,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(245, 245, 245, 1)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text(
                "Skip and go home",
                style: TextStyle(
                    color: Color.fromRGBO(215, 60, 16, 1), fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
