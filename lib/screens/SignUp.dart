// ignore_for_file: prefer_const_constructorsimport 'package:firebase_auth/firebase_auth.dart';, avoid_unnecessary_containers, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getfitts/screens/LandingPage.dart';
import 'package:getfitts/screens/Login.dart';
import 'package:getfitts/screens/VerifyEmail.dart';
import 'package:getfitts/utils/application_state.dart';
import 'package:provider/provider.dart';

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
    _firstName = TextEditingController();
    _lastName = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _firstName.dispose();
    _lastName.dispose();

    super.dispose();
  }

  signUp() async {
    try {
      ApplicationState applicationState =
          Provider.of<ApplicationState>(context, listen: false);
      applicationState.signUp(
          _email.text, _password.text, _firstName.text, _lastName.text, (e) {});

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VerifyEmail()));
    } catch (e) {
      print("error");
    }
  }

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
                      controller: _email,
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
                      controller: _password,
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
                    width: 370,
                    child: ElevatedButton(
                      onPressed: signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(215, 60, 16, 1),
                        textStyle: TextStyle(color: Colors.white, fontSize: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.transparent)),
                        padding: EdgeInsets.all(20),
                      ),
                      child: Text("Create account"),
                    ),
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
