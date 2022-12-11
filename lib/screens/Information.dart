import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  TextEditingController dateInputController = TextEditingController();
  String selectedValue = "Yes";

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
            onPressed: () => {},
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
              height: 15,
            ),
            Text(
                'kindly answer the following questions to get exercises more tailored to you.'),
            SizedBox(
              height: 15,
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
            SizedBox(
              width: 350,
              height: 45,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems,
                  ),
                ),
              ),
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
            SizedBox(
              width: 350,
              height: 45,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Is your hypertension controlled?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 350,
              height: 45,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'It is controlled if you are on medications',
              style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
            ),
            SizedBox(
              height: 150,
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
