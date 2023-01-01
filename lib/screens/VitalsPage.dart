// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/api/firebase_api.dart';
import 'package:getfitts/model/vitals.dart';
import 'package:getfitts/provider/vitals.dart';
import 'package:getfitts/screens/Vitals.dart';
import 'package:provider/provider.dart';

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
        body: StreamBuilder(
          stream: readVitals(),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong!');
            } else if (snapshot.hasData) {
              final vitals = snapshot.data!;

              return ListView(
                children: vitals.map(buildVital).toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }

  Widget buildVital(Vital vital) => ListTile(
        title: Text(vital.bloodPressure),
      );

  Stream<List<Vital>> readVitals() => FirebaseFirestore.instance
      .collection('vitalsign')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Vital.fromJson(doc.data())).toList());
}
