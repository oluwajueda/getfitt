// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getfitts/model/vitals.dart';
import 'package:intl/intl.dart';

class Vitals extends StatefulWidget {
  const Vitals({super.key});

  @override
  State<Vitals> createState() => _VitalsState();
}

class _VitalsState extends State<Vitals> {
  var timeNow = DateFormat.Hm().format(DateTime.now());
  var yearNow = DateFormat.MMMMEEEEd().format(DateTime.now());

  late final TextEditingController _bloodPressure;
  late final TextEditingController _bloodSugar;
  late final TextEditingController _bodyTemp;

  @override
  void initState() {
    super.initState();
    _bloodPressure = TextEditingController();
    _bloodSugar = TextEditingController();
    _bodyTemp = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _bloodPressure.dispose();
    _bloodSugar.dispose();
    _bodyTemp.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future addVitals() async {
      final vitals = FirebaseFirestore.instance.collection('vitalsign').doc();

      final vital = Vital(
          id: vitals.id,
          createdOn: DateTime.now(),
          bloodSugar: _bloodSugar.text,
          bloodPressure: _bloodPressure.text,
          bodyTemp: _bodyTemp.text);

      final json = vital.toJson();

      await vitals.set(json);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(
              color: Colors.black,
              onPressed: () => {},
            ),
            actions: [
              IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ))
            ]),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Record your vitals",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "We are collecting your vitals to make better decision for you. Note that this is optional and information shared here is completely private",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(85, 85, 85, 1)),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 16, color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                    SizedBox(width: 100),
                    Row(
                      children: [
                        Text(yearNow,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(51, 51, 51, 1))),
                        Text(timeNow,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(51, 51, 51, 1)))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
                          child: Text(
                            "Blood pressure(mmHG)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ))),
                SizedBox(
                  width: 350,
                  height: 45,
                  child: TextFormField(
                    controller: _bloodPressure,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'e.g 120/70',
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
                Container(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
                          child: Text(
                            "Blood Sugar (mmol/L)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ))),
                SizedBox(
                  width: 350,
                  height: 45,
                  child: TextFormField(
                    controller: _bloodSugar,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'e.g 120/70',
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
                Container(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
                          child: Text(
                            "Body temperature (Fahrenheit)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ))),
                SizedBox(
                  width: 350,
                  height: 45,
                  child: TextFormField(
                    controller: _bodyTemp,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'e.g 70??F',
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
                  height: 230,
                ),
                SizedBox(
                  width: 370,
                  child: ElevatedButton(
                    onPressed: addVitals,
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
              ],
            ),
          ),
        ));
  }
}
