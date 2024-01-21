import 'package:apptivo/utility/utils.dart';
import 'package:flutter/material.dart';

class SalesReportController extends ChangeNotifier {
  int selectedRadio = 0;
  bool switchValue=true;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
    final TextEditingController timmingController = TextEditingController();
    List<String> selectedCheckboxes = [];

  void setSelectedRadio(int value) {
    selectedRadio = value;
    selectedCheckboxes.clear();
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context, {required bool isStart}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );

    if (picked != null) {
      if (isStart) {
        startDateController.text =
            Utils.convertToReadableDate(picked.toString());
      } else {
        endDateController.text = Utils.convertToReadableDate(picked.toString());
      }
      notifyListeners();
    }
  }

    void toggleCheckbox(String value) {
    if (selectedCheckboxes.contains(value)) {
      selectedCheckboxes.remove(value);
    } else {
      selectedCheckboxes.add(value);
    }
    notifyListeners();
  }

    String selectedOption = "All";

  void setSelectedOption(String option) {
    selectedOption = option;
    timmingController.text=option;
    notifyListeners();
  }

    void setSwitchValue(bool value) {
    switchValue = value;
    notifyListeners();
  }
}
