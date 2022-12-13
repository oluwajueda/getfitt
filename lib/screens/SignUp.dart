import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/LandingPage.dart';
import 'package:getfitts/screens/Login.dart';
import 'package:getfitts/screens/VerifyEmail.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
  }

  bool _loadingButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()))
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LandingPage()))
                    },
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ))
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 32),
                            ),
                          ))),
                  Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 8, 6),
                            child: Text(
                              "First name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ))),
                  SizedBox(
                    width: 350,
                    height: 45,
                    child: TextFormField(
                      controller: _firstName,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'e.g John',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey),
                          filled: true,
                          fillColor: Color.fromRGBO(245, 245, 245, 1),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          labelStyle: TextStyle(fontSize: 13)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 8, 6),
                            child: Text(
                              "Last name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ))),
                  SizedBox(
                    width: 350,
                    height: 45,
                    child: TextFormField(
                      controller: _lastName,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'e.g Doe',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey),
                          filled: true,
                          fillColor: Color.fromRGBO(245, 245, 245, 1),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          labelStyle: TextStyle(fontSize: 13)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 8, 6),
                            child: Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ))),
                  SizedBox(
                    width: 350,
                    height: 45,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'e.g johndoe@gmail.com',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey),
                          filled: true,
                          fillColor: Color.fromRGBO(245, 245, 245, 1),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          labelStyle: TextStyle(fontSize: 13)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 8, 6),
                            child: Text(
                              "Password",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ))),
                  SizedBox(
                    width: 350,
                    height: 45,
                    child: TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromRGBO(245, 245, 245, 1),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          labelStyle: TextStyle(fontSize: 13)),
                    ),
                  ),
                  SizedBox(
                    height: 200,
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
                                    builder: (context) => VerifyEmail()));
                          },
                          child: Text(
                            "Create Account",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('have an account?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text('Login In',
                            style: TextStyle(
                                color: Color.fromRGBO(74, 193, 186, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
