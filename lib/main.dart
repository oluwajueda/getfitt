import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getfitts/screens/LandingPage.dart';
import 'package:getfitts/screens/SignUp.dart';

void main() {
  runApp(MaterialApp(
    title: 'Getfitts',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of my application.

  @override
  Widget build(BuildContext context) {
    return SignUp();
  }
}
