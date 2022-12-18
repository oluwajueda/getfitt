import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");
  Future createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.uid).set(user);
    } catch (e) {
      print('');
    }
  }
}
