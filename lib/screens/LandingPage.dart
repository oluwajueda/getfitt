import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/utils/custom_theme.dart';

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
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/getfit_background_image.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 38,
            ),
            Text("getfitt.",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(215, 60, 16, 1),
                    fontSize: 48,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 420,
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
            Container(
                width: 370,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(245, 245, 245, 1)),
                child: Text(
                  "Sign up with google",
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                )),
            SizedBox(
              height: 16,
            ),
            Container(
                width: 370,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(215, 60, 16, 1)),
                child: Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
