import 'package:apptivo/helper/core/app_spacing.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:apptivo/helper/core/routes.dart';
import 'package:apptivo/view/Report/screen_report_category.dart';
import 'package:apptivo/view/authentication/login_screen.dart';
import 'package:apptivo/view/booking/screen_booking.dart';
import 'package:apptivo/view/booking_new/screen_booking_new.dart';
import 'package:apptivo/view/delete_sale/screen_delete_sales.dart';
import 'package:apptivo/view/gamechange/game_change_screen.dart';
import 'package:apptivo/view/result/screen_result.dart';
import 'package:apptivo/view/salesreport/screen_sales_report.dart';
import 'package:apptivo/view/sub_dealer/screen_sub_dealer_category.dart';
import 'package:apptivo/widgets/common_buttons.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: AppColoring.selctedThemeColor,
        title: const Text(
          'Dear',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18), // Set text color to white
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Are you sure!'),
                      content: const Text('Do you want to logout?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              RouteConstat.back(context);
                            },
                            child: const Text('No')),
                        TextButton(
                            onPressed: () {
                              RouteConstat.back(context);
                              RouteConstat.nextRemoveUntileNamed(
                                  context, const ScreenLogin());
                            },
                            child: const Text('Yes'))
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppSpacing.ksizedBox15,
            Center(
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Hello ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    TextSpan(
                      text: '(Dealer)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.ksizedBox20,
            CommonOptionButtonWidget(
                onPressed: () {
                  RouteConstat.nextNamed(context, const ScreenBooking());
                },
                text: 'Booking'),
            AppSpacing.ksizedBox10,
            CommonOptionButtonWidget(
                onPressed: () {
                  RouteConstat.nextNamed(context, const ScreenBookingNew());
                },
                text: 'Booking New'),
            AppSpacing.ksizedBox10,
            CommonOptionButtonWidget(
                onPressed: () {
                  RouteConstat.nextNamed(context, const ScreenSalesRepeort());
                },
                text: 'Sales Report'),
            AppSpacing.ksizedBox10,
            CommonOptionButtonWidget(
                onPressed: () {
                  RouteConstat.nextNamed(context, const ScreenDeleteSales());
                },
                text: 'Delete Sales'),
            AppSpacing.ksizedBox10,
            CommonOptionButtonWidget(
                onPressed: () {
                  RouteConstat.nextNamed(context, const ScreenReportCategory());
                },
                text: 'Report'),
            AppSpacing.ksizedBox10,
            CommonOptionButtonWidget(
                onPressed: () {
                  RouteConstat.nextNamed(context, const ScreenResult());
                },
                text: 'Results'),
            AppSpacing.ksizedBox10,
            CommonOptionButtonWidget(
                onPressed: () {
                  RouteConstat.nextNamed(
                      context, const ScreenSubDealerCategory());
                },
                text: 'Sub Dealers Report'),
            AppSpacing.ksizedBox10,
            CommonOptionButtonWidget(
                onPressed: () {
                  RouteConstat.nextNamed(context, const ScreenGameChange());
                },
                text: 'Change Game'),
          ],
        ),
      ),
    );
  }
}
