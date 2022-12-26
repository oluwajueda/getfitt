// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/SignUp.dart';
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
              "To complete your account creation, use the link sent to your email",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(51, 51, 51, 1)),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Text(
                    "Resend link",
                  ),
                )),
            SizedBox(height: 25),
            SizedBox(
              width: 350,
              height: 45,
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(215, 60, 16, 1)),
                  child: GestureDetector(
                    onTap: () {
                      final user = FirebaseAuth.instance.currentUser;
                      user?.reload();

                      if (user?.emailVerified ?? false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyPhone()));
                      } else {
                        print('You need to verify your email first');
                      }
                    },
                    child: Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "If you don't see our email in your inbox, please check your spam folder"),
            )
          ],
        ),
      ),
    );
  }
}
