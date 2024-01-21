import 'package:flutter/material.dart';

class BookingNewController extends ChangeNotifier {
  int selectedRadio = 1;
  String? selectedDropdownValue;

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