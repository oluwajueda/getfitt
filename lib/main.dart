import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getfitts/screens/GetNotification.dart';
import 'package:getfitts/screens/Information.dart';
import 'package:getfitts/screens/LandingPage.dart';
import 'package:getfitts/screens/Login.dart';
import 'package:getfitts/screens/SignUp.dart';
import 'package:getfitts/screens/VerifyEmail.dart';
import 'package:getfitts/screens/VerifyPhone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getfitts/utils/application_state.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => Consumer<ApplicationState>(
        builder: (context, applicationState, _) {
          Widget child;
          switch (applicationState.loginState) {
            case ApplicationLoginState.loggedOut:
              child = Login();

              break;
            case ApplicationLoginState.loggedIn:
              child = MyApp();
              break;

            default:
              child = Login();
          }

          return MaterialApp(
            home: child,
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of my application.

  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}
