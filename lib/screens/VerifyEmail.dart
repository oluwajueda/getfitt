// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfitts/screens/VerifyPhone.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
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
                  image: DecorationImage(
                      image: AssetImage('assets/images/fittsarrow.png')),
                  color: Color.fromRGBO(245, 245, 245, 1),
                  shape: BoxShape.circle),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              child: Text(
                "Check your inbox",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "To complete your account creation, click on the link sent to your email and come back to proceed",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(51, 51, 51, 1)),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Text(
                    "Resend link",
                    style: TextStyle(color: Color.fromRGBO(215, 60, 16, 1)),
                  ),
                )),
            SizedBox(height: 25),
            SizedBox(
              width: 370,
              child: ElevatedButton(
                onPressed: () {
                  final user = FirebaseAuth.instance.currentUser;
                  user?.reload();

                  if (user?.emailVerified ?? false) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VerifyPhone()));
                  } else {
                    print('You need to verify your email first');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(215, 60, 16, 1),
                  textStyle: TextStyle(color: Colors.white, fontSize: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.transparent)),
                  padding: EdgeInsets.all(18),
                ),
                child: Text("Proceed"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "If you don't see our email in your inbox, please check your spam folder",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
