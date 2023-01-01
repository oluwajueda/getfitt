// import 'package:flutter/cupertino.dart';
// import 'package:getfitts/api/firebase_api.dart';
// import 'package:getfitts/model/vitals.dart';

// class VitalsProvider extends ChangeNotifier {
//   List<Vital> _vitals = [];

//   List<Vital> get vitals => _vitals.toList();

//   void setTodos(List<Vital> vitals) =>
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _vitals = vitals;

//         notifyListeners();
//       });

//   void addVitals(Vital vital) => FirebaseApi.createVitals(vital);
// }
