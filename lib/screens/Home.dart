// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:getfitts/provider/exerciseCounter.dart';
import 'package:getfitts/screens/ExerciseInformation.dart';
import 'package:getfitts/screens/HealthyUserPage.dart';
import 'package:getfitts/screens/Vitals.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<ExerciseCounter>(context, listen: false);

    final percent = counter.count;

    Future checkFirstSeen() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool _seen = (prefs.getBool('seen') ?? false);

      if (_seen) {
        return;
      } else {
        await prefs.setBool('seen', true);
        SchedulerBinding.instance.addPostFrameCallback((timestamp) {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 516,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: (() {
                                Navigator.pop(context);
                              }),
                              icon: Icon(Icons.close),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 151,
                          height: 151,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/celebrate2.png')),
                              color: Color.fromRGBO(245, 245, 245, 1),
                              shape: BoxShape.circle),
                        ),
                        Text(
                          'Welcome, Adedeji!',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "We are happy to see you making moves about your health. We are ready and committed to serve you!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(85, 85, 85, 1),
                              fontSize: 14),
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 350,
                          child: ElevatedButton(
                            onPressed: (() {
                              Navigator.pop(context);
                            }),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(215, 60, 16, 1),
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.transparent)),
                              padding: EdgeInsets.all(18),
                            ),
                            child: Text("Thank you!"),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Read some benefits of Getfitt App',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                );
              });
        });
      }
    }

    @override
    void afterFirstLayout(BuildContext context) => checkFirstSeen();
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;

    final uid = user?.email;

    Future getUserInfo() async {
      return await FirebaseFirestore.instance
          .collection("vitals")
          .doc(uid)
          .get();
    }

    ;

    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: getUserInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data.docs;
                final diabeticState = data["isDiabeticControlled"];
                final hypertensiveState = data["isHypertensionControlled"];

                if (diabeticState == "Yes") {}

                if (hypertensiveState == "Yes") {}
              }
              return HealthyUser();
            }));
  }
}
