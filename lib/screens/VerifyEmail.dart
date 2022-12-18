// ignore_for_file: prefer_const_constructors

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()))
          },
        ),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()))
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Verify your email",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            const Text(
              "We sent a code to your email adebolanle@gmail.com",
              style:
                  TextStyle(fontSize: 14, color: Color.fromRGBO(85, 85, 85, 1)),
            ),
            SizedBox(
              height: 15,
            ),
            const Text(
              "Enter OTP code",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 350,
              height: 45,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    filled: true,
                    fillColor: Color.fromRGBO(245, 245, 245, 1),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent)),
                    labelStyle: TextStyle(fontSize: 13)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90),
              child: Text(
                  "Don't get the mail? Check your spam/junk or just resend it"),
            ),
            SizedBox(
              height: 400,
            ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyPhone()));
                    },
                    child: Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
