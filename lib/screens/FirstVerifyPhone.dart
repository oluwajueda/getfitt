// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getfitts/screens/VerifyPhone.dart';

class FirstVerifyPhone extends StatefulWidget {
  const FirstVerifyPhone({super.key});

  @override
  State<FirstVerifyPhone> createState() => _FirstVerifyPhoneState();
}

class _FirstVerifyPhoneState extends State<FirstVerifyPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  shape: BoxShape.circle),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              child: Text(
                "Phone Verification",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Kindly verify your phone number to get notified on your exercise schedules",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(51, 51, 51, 1)),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 370,
              child: ElevatedButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VerifyPhone()));
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(215, 60, 16, 1),
                  textStyle: TextStyle(color: Colors.white, fontSize: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.transparent)),
                  padding: EdgeInsets.all(18),
                ),
                child: Text("Continue"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You are almost there! just few steps and you are in already!",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
