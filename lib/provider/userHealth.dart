import 'package:flutter/cupertino.dart';

class UserHealthStat extends ChangeNotifier {
  bool isHypertensionControlled = true;

  bool get isHypertensionControl => isHypertensionControlled;

  void notControlled() {
    bool isHypertensionControlled = false;

    notifyListeners();
  }
}
