import 'package:flutter/material.dart';

class BookingController extends ChangeNotifier {
  int selectedRadio = 0;
  String selectedDropdownValue = '1';

  void setSelectedRadio(int value) {
    selectedRadio = value;
    notifyListeners();
    print(selectedRadio.toString());
  }

  void setSelectedDropdownValue(String value) {
    selectedDropdownValue = value;
    notifyListeners();
  }
}