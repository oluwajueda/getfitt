import 'package:flutter/cupertino.dart';

class ExerciseCounter extends ChangeNotifier {
  double _count = 0;

  double get count => _count;

  void increment() {
    _count = _count + 7;

    notifyListeners();
  }
}
