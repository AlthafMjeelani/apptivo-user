import 'package:apptivo/controller/sub_dealer/sub_daily_report_controller.dart';
import 'package:apptivo/helper/core/app_spacing.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:apptivo/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSubDailyRepeort extends StatefulWidget {
  const ScreenSubDailyRepeort({super.key});

  @override
  State<ScreenSubDailyRepeort> createState() => _ScreenSubDailyRepeortState();
}

class _ScreenSubDailyRepeortState extends State<ScreenSubDailyRepeort> {
  late SubDailyReportController subDailyReportController;
  @override
  void initState() {
    subDailyReportController =
        Provider.of<SubDailyReportController>(context, listen: false);
    subDailyReportController.startDateController.text =
        Utils.convertToReadableDate(DateTime.now().toString());

    subDailyReportController.endDateController.text =
        Utils.convertToReadableDate(DateTime.now().toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoring.selctedThemeColor,
        iconTheme: Theme.of(context).iconTheme,
        title: const Text('Sub Daily Report',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      body:
          Consumer(builder: (context, SubDailyReportController controller, _) {
        return ListView(
          children: [
            AppSpacing.ksizedBox30,
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('All'),
            ),
            AppSpacing.ksizedBox10,
            Divider(),
            AppSpacing.ksizedBox10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Consumer(builder: (context,
                  SubDailyReportController subDailyReportController, _) {
                return Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.w500),

                      readOnly: true,
                      //   enabled: false,
                      onTap: () {
                        subDailyReportController.selectDate(context,
                            isStart: true);
                      },
                      controller: subDailyReportController.startDateController,
                      decoration: const InputDecoration(hintText: 'Start Date'),
                    )),
                    AppSpacing.ksizedBoxW20,
                    Expanded(
                        child: TextFormField(
                      onTap: () {
                        subDailyReportController.selectDate(context,
                            isStart: false);
                      },
                      readOnly: true,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      controller: subDailyReportController.endDateController,
                      decoration: const InputDecoration(hintText: 'End Date'),
                    )),
                  ],
                );
              }),
            ),
            AppSpacing.ksizedBox10,
            Row(
              children: [
                AppSpacing.ksizedBoxW15,
                Expanded(
                  child: TextField(
                    onTap: () {
                      _showPopup(context);
                    },
                    textAlign: TextAlign.center,
                    controller: subDailyReportController.timmingController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: 'Time',
                    ),
                  ),
                ),
                AppSpacing.ksizedBoxW40,
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColoring.selctedThemeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      // Handle button click
                    },
                    child: const Text(
                      'Search',
                      style: TextStyle(
                          color: AppColoring.kAppWhiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                AppSpacing.ksizedBoxW15
              ],
            ),
            AppSpacing.ksizedBox10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicWidth(
                child: Stack(
                  children: [
                    Container(
                      // height: 25,
                      color: AppColoring.lightBg,
                    ),
                    FittedBox(
                      child: DataTable(
                        // headingRowHeight: 20,
                        border: TableBorder.all(),
                        columns: const [
                          DataColumn(
                              label: Text(
                            'Date',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'Dealer',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'T.Sale',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'T.W Amnt',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'Balance',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                        ],
                        rows: List.generate(2, (index) {
                          return DataRow(cells: <DataCell>[
                            DataCell(Text(
                              '10/01/2024',
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                            const DataCell(Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                            const DataCell(Text(
                              '12',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                            DataCell(Text(
                              '$index',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                            const DataCell(Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                          ]);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //   title: Text('Select an option'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Set this to minimize the dialog size
              children: [
                RadioListTile<String>(
                  title: const Text(
                    'All',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  value: 'All',
                  groupValue: Provider.of<SubDailyReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubDailyReportController>(context,
                            listen: false)
                        .setSelectedOption(value!);
                    Navigator.pop(context);
                  },
                ),
                RadioListTile<String>(
                  title: const Text(
                    '1:00PM',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  value: '1:00PM',
                  groupValue: Provider.of<SubDailyReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubDailyReportController>(context,
                            listen: false)
                        .setSelectedOption(value!);
                    Navigator.pop(context);
                  },
                ),
                RadioListTile<String>(
                  title: const Text(
                    '6:00PM',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  value: '6:00PM',
                  groupValue: Provider.of<SubDailyReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubDailyReportController>(context,
                            listen: false)
                        .setSelectedOption(value!);
                    Navigator.pop(context);
                  },
                ),
                RadioListTile<String>(
                  title: const Text(
                    'KL',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  value: 'KL',
                  groupValue: Provider.of<SubDailyReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubDailyReportController>(context,
                            listen: false)
                        .setSelectedOption(value!);
                    Navigator.pop(context);
                  },
                ),
                RadioListTile<String>(
                  title: const Text(
                    '8:00PM',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  value: '8:00PM',
                  groupValue: Provider.of<SubDailyReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubDailyReportController>(context,
                            listen: false)
                        .setSelectedOption(value!);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
