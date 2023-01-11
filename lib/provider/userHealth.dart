import 'package:flutter/cupertino.dart';

class UserHealthStatus extends ChangeNotifier {
  bool _isHypertensionControlled = true;

  bool get isHypertensionControlled => _isHypertensionControlled;

  void notControlled() {
    _isHypertensionControlled = false;

    notifyListeners();
  }
}
