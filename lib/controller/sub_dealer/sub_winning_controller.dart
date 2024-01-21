import 'package:apptivo/utility/utils.dart';
import 'package:flutter/material.dart';

class SubWinningReportController extends ChangeNotifier {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  final TextEditingController timmingController = TextEditingController();

  final TextEditingController winningTypeController = TextEditingController();
  final TextEditingController detailsOrSummaryController =
      TextEditingController();

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
    timmingController.text = option;
    notifyListeners();
  }

  String selectedWinningType = "All";

  void setSelectedWinningType(String option) {
    selectedWinningType = option;
    winningTypeController.text = option;
    notifyListeners();
  }

  List<String> winningType = [
    'All',
    'First',
    'Second',
    'Third',
    'Fourth',
    'Fifth',
    'Comp6',
    'Box',
    'AB/AC/BC ALL',
    'AB',
    'AC',
    'BC',
    'Board All',
    'A',
    'B',
    'C'
  ];


  String viewType='list';
 void setView(String type){
viewType=type;
notifyListeners();
  }

 List<String> detailOrSummaryList = [
    'Detailed',
    'Summary',
  
  ];
    String selectedDetailOrSummary = "Detailed";

  void setSelectedDetailOrSummary(String option) {
    selectedDetailOrSummary = option;
    detailsOrSummaryController.text = option;
    notifyListeners();
  }
}
