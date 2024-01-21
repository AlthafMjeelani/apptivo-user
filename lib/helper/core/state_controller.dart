import 'package:apptivo/controller/Result/result_controller.dart';
import 'package:apptivo/controller/authentication/login_controller.dart';
import 'package:apptivo/controller/bokking_new/booking_new_controller.dart';
import 'package:apptivo/controller/bookings/booking_controller.dart';
import 'package:apptivo/controller/delete_sales/delete_sales_controller.dart';
import 'package:apptivo/controller/game_change_controller.dart';
import 'package:apptivo/controller/salesreport/sales_report_controller.dart';
import 'package:apptivo/controller/sub_dealer/sub_daily_report_controller.dart';
import 'package:apptivo/controller/sub_dealer/sub_winning_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderStateController {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => LoginController(),
    ),
    ChangeNotifierProvider(
      create: (context) => GameChangeController(),
    ),
      ChangeNotifierProvider(
      create: (context) => BookingController(),
    ),
      ChangeNotifierProvider(
      create: (context) => BookingNewController(),
    ),
      ChangeNotifierProvider(
      create: (context) => SalesReportController(),
    ),
    ChangeNotifierProvider(
      create: (context) => DeleteSalesController(),
    ),
     ChangeNotifierProvider(
      create: (context) => SubDailyReportController(),
    ),
     ChangeNotifierProvider(
      create: (context) => SubWinningReportController(),
    ),
      ChangeNotifierProvider(
      create: (context) => ResultController(),
    ),
  ];
}
