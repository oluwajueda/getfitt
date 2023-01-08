// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getfitts/screens/VerifyEmail.dart';
import 'package:getfitts/screens/VerifyPhoneCode.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

@override
class _VerifyPhoneState extends State<VerifyPhone> {
  final _phoneController = TextEditingController();

  void initState() {
    super.initState();

    _phoneController.addListener(() {
      setState(() {
        submit = _phoneController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  proceed() async {
    print('hello');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                VerifyPhoneCode(phone: _phoneController.text)));
  }

  bool submit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VerifyEmail()))
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What's your phone number",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                "We sent a code to your email adebolanle@gmail.com",
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(85, 85, 85, 1)),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                "Enter phone number",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 350,
                height: 45,
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: 'e.g 070 000 000 000',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      border: InputBorder.none,
                      filled: true,
                      focusedBorder: InputBorder.none,
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
                height: 350,
              ),
              SizedBox(
                width: 370,
                child: ElevatedButton(
                  onPressed: proceed,
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
      ),
    );
  }
}
