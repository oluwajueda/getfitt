// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:getfitts/model/vitals.dart';
// import 'package:getfitts/utils/tranformer.dart';

// class FirebaseApi {
//   static Future<String> createVitals(Vital vital) async {
//     final docVitals = FirebaseFirestore.instance.collection('vital').doc();

//     vital.id = docVitals.id;

//     await docVitals.set(vital.toMap());
//     return docVitals.id;
//   }

//   static readVitals() =>
//       FirebaseFirestore.instance.collection('vital').snapshots();
// }
