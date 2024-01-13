import 'package:apptivo/view/home/screen_home.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:apptivo/helper/core/routes.dart';
import 'package:flutter/material.dart';

class GameChangeController with ChangeNotifier {
  changeColor({required Color color,required BuildContext context}) {
    AppColoring.selctedThemeColor = color;
    notifyListeners();
    RouteConstat.nextRemoveUntileNamed(context, const ScreenHome());

  }
}
