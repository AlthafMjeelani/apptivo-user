import 'package:apptivo/controller/authentication/login_controller.dart';
import 'package:apptivo/controller/bookings/booking_controller.dart';
import 'package:apptivo/controller/game_change_controller.dart';
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
  ];
}
