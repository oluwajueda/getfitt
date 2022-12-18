import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum ApplicationLoginState { loggedOut, loggedIn }

class ApplicationState extends ChangeNotifier {
  User? user;
  ApplicationLoginState loginState = ApplicationLoginState.loggedOut;

  ApplicationState() {
    init();
  }

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((userFir) {
      if (userFir != null) {
        loginState = ApplicationLoginState.loggedIn;

        user = userFir;
      } else {
        loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  Future signUp(String email, String password, String firstName, lastName,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
    }
  }

  Future<void> signIn(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.sendEmailVerification();
    } else {
      print('please log in');
    }
  }
}
