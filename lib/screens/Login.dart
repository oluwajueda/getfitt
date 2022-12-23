import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getfitts/screens/Home.dart';
import 'package:getfitts/screens/SignUp.dart';
import 'package:provider/provider.dart';
import 'package:getfitts/utils/application_state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _email;
  late final TextEditingController _password;

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

  login() async {
    try {
      ApplicationState applicationState =
          Provider.of<ApplicationState>(context, listen: false);
      applicationState.signIn(_email.text, _password.text, (e) {});

      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {}
  }

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
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 32),
                            ),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 8, 8, 6),
                            child: Text(
                              "Enter your email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ))),
                  SizedBox(
                    width: 350,
                    height: 45,
                    child: TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          hintText: 'e.g johndoe@gmail.com',
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
                              "Enter your password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ))),
                  SizedBox(
                    width: 350,
                    height: 45,
                    child: TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _password,
                      obscureText: true,
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
                    height: 350,
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
                          onTap: login,
                          child: Text(
                            "Login",
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
                      Text("Don't have an account?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text('Sign Up',
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
