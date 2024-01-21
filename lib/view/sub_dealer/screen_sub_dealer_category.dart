import 'package:apptivo/helper/core/app_spacing.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:apptivo/helper/core/routes.dart';
import 'package:apptivo/view/booking/screen_booking.dart';
import 'package:apptivo/view/salesreport/screen_sales_report.dart';
import 'package:apptivo/view/sub_dealer/sub_daily_report.dart';
import 'package:apptivo/view/sub_dealer/sub_winning_report.dart';
import 'package:apptivo/widgets/common_buttons.dart';
import 'package:flutter/material.dart';

class ScreenSubDealerCategory extends StatelessWidget {
  const ScreenSubDealerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoring.selctedThemeColor,
        iconTheme: Theme.of(context).iconTheme,
        title: const Text('Sub Dealer Report',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            AppSpacing.ksizedBox80,
            CommonOptionButtonWidget(
                onPressed: () {
                   RouteConstat.nextNamed(context, const ScreenSubDailyRepeort());
                },
                text: 'Daily Report'),
            AppSpacing.ksizedBox10,
            CommonOptionButtonWidget(
                onPressed: () {
                  RouteConstat.nextNamed(context, const ScreenSalesRepeort());
                },
                text: 'Sales Report'),
            AppSpacing.ksizedBox10,
            CommonOptionButtonWidget(
                onPressed: () {
                    RouteConstat.nextNamed(context, const ScreenSubWinningRepeort());
                },
                text: 'Winning Report'),
          ],
        ),
      ),
    );
  }
}
