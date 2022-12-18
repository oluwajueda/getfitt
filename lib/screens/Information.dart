// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/SignUp.dart';
import 'package:intl/intl.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  TextEditingController dateInputController = TextEditingController();
  String firstDropdownValue = "No";
  String secondDropdownValue = "Yes";

  String firstDrop = "No";
  String secondDrop = "Yes";
  @override
  void initState() {
    dateInputController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            Text(
              "Great, now let's get to know you",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'kindly answer the following questions to get exercises more tailored to you.'),
            SizedBox(
              height: 10,
            ),
            Text(
              'Date of birth',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 350,
              height: 45,
              child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      fillColor: Color.fromRGBO(245, 245, 245, 1),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent)),
                      labelStyle: TextStyle(fontSize: 13)),
                  controller: dateInputController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat("yy/MM/DD").format(pickedDate);

                      setState(() {
                        dateInputController.text = formattedDate;
                      });
                    } else {}
                  }),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Are you diabetic',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 350,
                  height: 45,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: firstDropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              firstDropdownValue = newValue!;
                            });
                          },
                          items: <String>['No', 'Yes']
                              .map<DropdownMenuItem<String>>((String doaValue) {
                            return DropdownMenuItem(
                                value: doaValue, child: Text(doaValue));
                          }).toList()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                firstDropdownValue == 'No'
                    ? SizedBox()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Is your diabetics controlled',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 350,
                            height: 45,
                            child: DecoratedBox(
                              decoration: ShapeDecoration(
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    value: firstDropdownValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        secondDropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>['No', 'Yes']
                                        .map<DropdownMenuItem<String>>(
                                            (String doaValue) {
                                      return DropdownMenuItem(
                                          value: doaValue,
                                          child: Text(doaValue));
                                    }).toList()),
                              ),
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Are you hypertensive',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 350,
                  height: 45,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: firstDrop,
                          onChanged: (String? newValue) {
                            setState(() {
                              firstDrop = newValue!;
                            });
                          },
                          items: <String>['No', 'Yes']
                              .map<DropdownMenuItem<String>>((String doaValue) {
                            return DropdownMenuItem(
                                value: doaValue, child: Text(doaValue));
                          }).toList()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                firstDrop == "No"
                    ? SizedBox()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Is your hypertensive controlled',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 350,
                            height: 45,
                            child: DecoratedBox(
                              decoration: ShapeDecoration(
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    value: firstDropdownValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        firstDropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>['No', 'Yes']
                                        .map<DropdownMenuItem<String>>(
                                            (String doaValue) {
                                      return DropdownMenuItem(
                                          value: doaValue,
                                          child: Text(doaValue));
                                    }).toList()),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'It is controlled if you are on medications',
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                          ),
                        ],
                      )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 350,
              height: 45,
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(215, 60, 16, 1)),
                  child: Text(
                    "Save and Continue",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text('Yes'), value: 'Yes'),
    DropdownMenuItem(child: Text('No'), value: 'No')
  ];
  return menuItems;
}
