import 'package:apptivo/utility/utils.dart';
import 'package:flutter/material.dart';

class ResultController with ChangeNotifier {
  TextEditingController dateController=TextEditingController(text: Utils.convertToReadableDate(DateTime.now().toString()));

  Future<void> selectDate(BuildContext context, ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );

    if (picked != null) {
     
        dateController.text = Utils.convertToReadableDate(picked.toString());
      
      notifyListeners();
    }
  }
}