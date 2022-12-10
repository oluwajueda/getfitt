import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ))
      ]),
      body: Column(
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
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(245, 245, 245, 1),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
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
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(245, 245, 245, 1),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
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
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(245, 245, 245, 1),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
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
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(245, 245, 245, 1),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        labelStyle: TextStyle(fontSize: 13)),
                  ),
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
                        "Create Account",
                        style: TextStyle(color: Colors.white),
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
                    Text('Sign Up',
                        style: TextStyle(
                            color: Color.fromRGBO(74, 193, 186, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
