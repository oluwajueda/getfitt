// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getfitts/TimerScreen.dart';
import 'package:getfitts/provider/vitals.dart';
import 'package:getfitts/screens/GetNotification.dart';
import 'package:getfitts/screens/Home.dart';
import 'package:getfitts/screens/Information.dart';
import 'package:getfitts/screens/LandingPage.dart';
import 'package:getfitts/screens/Login.dart';
import 'package:getfitts/screens/OTP.dart';
import 'package:getfitts/screens/SignUp.dart';
import 'package:getfitts/screens/VerifyEmail.dart';
import 'package:getfitts/screens/VerifyPhone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getfitts/screens/VerifyPhoneCode.dart';
import 'package:getfitts/screens/Vitals.dart';
import 'package:getfitts/screens/VitalsPage.dart';
import 'package:getfitts/screens/VitalsSaved.dart';
import 'package:getfitts/utils/application_state.dart';
import 'package:getfitts/utils/sendOTP.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:getfitts/screens/FirstVerifyPhone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => VitalsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ApplicationState(),
        builder: (context, _) => Consumer<ApplicationState>(
          builder: (context, applicationState, _) {
            Widget child;
            switch (applicationState.loginState) {
              case ApplicationLoginState.loggedOut:
                child = LandingPage();

                break;
              case ApplicationLoginState.loggedIn:
                child = MyApp();
                break;

              default:
                child = MyApp();
            }

            return MaterialApp(
                home: Vitals(), routes: {"phone": (context) => VerifyPhone()});
          },
        ),
      ),
    ],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of my application.

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            title: Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TabBar(indicatorColor: Colors.transparent,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  Tab(icon: Image.asset("assets/images/homefitt.png")),
                  Tab(icon: Image.asset("assets/images/secondIconfitt.png")),
                  Tab(icon: Image.asset("assets/images/thirdIcon.png")),
                  Tab(icon: Image.asset("assets/images/4thIcon.png")),
                ]),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          body: TabBarView(children: [
            Home(),
            Home(),
            Home(),
            Home(),
          ]),
        ));
  }
}
