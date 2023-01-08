// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/api/firebase_api.dart';
import 'package:getfitts/model/vitals.dart';
import 'package:getfitts/provider/vitals.dart';
import 'package:getfitts/screens/Vitals.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class VitalsPage extends StatefulWidget {
  const VitalsPage({super.key});

  @override
  State<VitalsPage> createState() => _VitalsPageState();
}

class _VitalsPageState extends State<VitalsPage> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<VitalsProvider>(context);
    // final vital = provider.vitals;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Colors.black, onPressed: () => {}),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ))
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Vitals',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 32),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Container(
                height: height * 0.20,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Blood Pressure',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Last 7 days",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      StreamBuilder(
                        stream: readVitals(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong!');
                          } else if (snapshot.hasData) {
                            final vitals = snapshot.data!;

                            return Row(
                              children: vitals.map(buildPressure).toList(),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: height * 0.20,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Blood Pressure',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Last 7 days",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      StreamBuilder(
                        stream: readVitals(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong!');
                          } else if (snapshot.hasData) {
                            final vitals = snapshot.data!;

                            return Row(
                              children: vitals.map(buildGlucose).toList(),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildPressure(Vital vital) => Row(
        children: [
          Column(
            children: [
              Transform.rotate(
                  angle: (-30 * -math.pi) / 180,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 14, 0, 15),
                    child: Text(
                      vital.bloodPressure,
                      style: TextStyle(
                          color: Color.fromRGBO(215, 60, 16, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Text(
                  DateFormat("EEE")
                      .format(vital.createdOn!)
                      .substring(0, 1)
                      .toString(),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 5,
          )
        ],
      );
  Widget buildGlucose(Vital vital) => Row(
        children: [
          Column(
            children: [
              Transform.rotate(
                  angle: (-30 * -math.pi) / 180,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 14, 0, 15),
                    child: Text(
                      vital.bloodSugar,
                      style: TextStyle(
                          color: Color.fromRGBO(215, 60, 16, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Text(
                  DateFormat("EEE")
                      .format(vital.createdOn!)
                      .substring(0, 1)
                      .toString(),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 5,
          )
        ],
      );

  // (
  //       title: Transform.rotate(
  //           angle: (-6 * -math.pi) / 180,
  //           child: Padding(
  //             padding: const EdgeInsets.only(top: 30),
  //             child: Text(
  //               vital.bloodPressure,
  //               style: TextStyle(
  //                   color: Color.fromRGBO(215, 60, 16, 1),
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 13),
  //             ),
  //           )),
  //       subtitle:
  //     );

  Stream<List<Vital>> readVitals() => FirebaseFirestore.instance
      .collection('vitalsign')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Vital.fromJson(doc.data())).toList());
}
