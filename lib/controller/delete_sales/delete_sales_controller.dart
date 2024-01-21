import 'package:flutter/material.dart';

class DeleteSalesController with ChangeNotifier {
  bool switchValue = false;
  void setSwitchValue(bool value) {
    switchValue = value;
    notifyListeners();
  }
}
