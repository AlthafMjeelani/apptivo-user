import 'package:apptivo/utility/utils.dart';
import 'package:flutter/material.dart';

class SubDailyReportController extends ChangeNotifier {
 
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
    final TextEditingController timmingController = TextEditingController();
 

 

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

 

    String selectedOption = "All";

  void setSelectedOption(String option) {
    selectedOption = option;
    timmingController.text=option;
    notifyListeners();
  }


}
