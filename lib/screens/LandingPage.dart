// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getfitts/screens/SignUp.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/getfit_background_image.png",
                ),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.darken),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 58,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("getfitt.",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(215, 60, 16, 1),
                      fontSize: 52,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 380,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Stay healthy at all times with getfitt",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36.1,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Container(
            //     width: 370,
            //     alignment: Alignment.center,
            //     padding: EdgeInsets.symmetric(vertical: 20),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: Color.fromRGBO(245, 245, 245, 1)),
            //     child: Text(
            //       "Sign up with google",
            //       style: TextStyle(
            //           color: Color.fromRGBO(0, 0, 0, 1),
            //           fontWeight: FontWeight.w500),
            //     )),
            SizedBox(
              width: 370,
              child: ElevatedButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                }),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(color: Colors.white, fontSize: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.transparent)),
                  padding: EdgeInsets.all(20),
                ),
                child: Text("Sign up with google"),
              ),
            ),

            SizedBox(
              height: 16,
            ),

            SizedBox(
              width: 370,
              child: ElevatedButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(215, 60, 16, 1),
                  textStyle: TextStyle(color: Colors.white, fontSize: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.transparent)),
                  padding: EdgeInsets.all(20),
                ),
                child: Text("create Account"),
              ),
            ),

            // Container(
            //     width: 370,
            //     alignment: Alignment.center,
            //     padding: EdgeInsets.symmetric(vertical: 20),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: Color.fromRGBO(215, 60, 16, 1)),
            //     child: GestureDetector(
            //       onTap: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => SignUp()));
            //       },z
            //       child: Text(
            //         "Create Account",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     )
            //     ),
          ],
        ),
      ),
    );
  }
}
