import 'package:apptivo/controller/sub_dealer/sub_winning_controller.dart';
import 'package:apptivo/helper/core/app_spacing.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:apptivo/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSubWinningRepeort extends StatefulWidget {
  const ScreenSubWinningRepeort({super.key});

  @override
  State<ScreenSubWinningRepeort> createState() =>
      _ScreenSubWinningRepeortState();
}

class _ScreenSubWinningRepeortState extends State<ScreenSubWinningRepeort> {
  late SubWinningReportController subWinningReportController;
  @override
  void initState() {
    subWinningReportController =
        Provider.of<SubWinningReportController>(context, listen: false);
    subWinningReportController.startDateController.text =
        Utils.convertToReadableDate(DateTime.now().toString());

    subWinningReportController.endDateController.text =
        Utils.convertToReadableDate(DateTime.now().toString());

    subWinningReportController.detailsOrSummaryController.text = 'Detailed';
    subWinningReportController.winningTypeController.text = 'All';
    subWinningReportController.timmingController.text = 'All';
        subWinningReportController.viewType = 'list';


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoring.selctedThemeColor,
        iconTheme: Theme.of(context).iconTheme,
        title: const Text('Sub Winning Report',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      body: Consumer(
          builder: (context, SubWinningReportController controller, _) {
        return ListView(
          children: [
            AppSpacing.ksizedBox30,
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Text('All'),
                  AppSpacing.ksizedBoxW120,
                  Expanded(
                    child: TextField(
                      onTap: () {
                        _showPopupDetailOrSummary(context);
                      },
                      textAlign: TextAlign.center,
                      controller:
                          subWinningReportController.detailsOrSummaryController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Detailed',
                      ),
                    ),
                  ),
                  AppSpacing.ksizedBoxW15,
                  Expanded(
                    child: TextField(
                      onTap: () {
                        _showPopup(context);
                      },
                      textAlign: TextAlign.center,
                      controller: subWinningReportController.timmingController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Time',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.ksizedBox10,
            const Divider(),
            AppSpacing.ksizedBox10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    style: const TextStyle(fontWeight: FontWeight.w500),

                    readOnly: true,
                    //   enabled: false,
                    onTap: () {
                      subWinningReportController.selectDate(context,
                          isStart: true);
                    },
                    controller: subWinningReportController.startDateController,
                    decoration: const InputDecoration(hintText: 'Start Date'),
                  )),
                  AppSpacing.ksizedBoxW20,
                  Expanded(
                      child: TextFormField(
                    onTap: () {
                      subWinningReportController.selectDate(context,
                          isStart: false);
                    },
                    readOnly: true,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    controller: subWinningReportController.endDateController,
                    decoration: const InputDecoration(hintText: 'End Date'),
                  )),
                ],
              ),
            ),
            AppSpacing.ksizedBox20,
            Row(
              children: [
                AppSpacing.ksizedBoxW15,
                Expanded(
                  child: TextField(
                    onTap: () {
                      _showPopupWinningType(context);
                    },
                    textAlign: TextAlign.center,
                    controller:
                        subWinningReportController.winningTypeController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: 'Time',
                    ),
                  ),
                ),
                AppSpacing.ksizedBoxW20,
                Column(
                  children: [
                    const Text(
                      'View Type',
                      style: TextStyle(
                          color: AppColoring.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        AppSpacing.ksizedBoxW20,
                        InkWell(
                          onTap: () {
                            controller.setView('list');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: controller.viewType == 'list'
                                      ? AppColoring.lightBg
                                      : AppColoring.kAppWhiteColor),
                              child: Icon(
                                Icons.format_list_bulleted,
                                color: Color.fromARGB(255, 143, 120, 120),
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.ksizedBoxW5,
                        InkWell(
                          onTap: () {
                            controller.setView('grid');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: controller.viewType == 'grid'
                                    ? AppColoring.lightBg
                                    : AppColoring.kAppWhiteColor),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.grid_view,
                                color: AppColoring.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.ksizedBoxW10,
                      ],
                    ),
                  ],
                ),
                AppSpacing.ksizedBoxW20,
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
                AppSpacing.ksizedBoxW15,
              ],
            ),
            AppSpacing.ksizedBox10,
            Divider()
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
                  groupValue: Provider.of<SubWinningReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubWinningReportController>(context,
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
                  groupValue: Provider.of<SubWinningReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubWinningReportController>(context,
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
                  groupValue: Provider.of<SubWinningReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubWinningReportController>(context,
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
                  groupValue: Provider.of<SubWinningReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubWinningReportController>(context,
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
                  groupValue: Provider.of<SubWinningReportController>(context)
                      .selectedOption,
                  onChanged: (value) {
                    Provider.of<SubWinningReportController>(context,
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

  void _showPopupWinningType(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //   title: Text('Select an option'),
          content: SingleChildScrollView(
            child: Column(
              children: subWinningReportController.winningType.map((type) {
                return RadioListTile<String>(
                  title: Text(
                    type,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  value: type,
                  groupValue: Provider.of<SubWinningReportController>(context)
                      .selectedWinningType,
                  onChanged: (value) {
                    Provider.of<SubWinningReportController>(context,
                            listen: false)
                        .setSelectedWinningType(value!);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _showPopupDetailOrSummary(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //   title: Text('Select an option'),
          content: SingleChildScrollView(
            child: Column(
              children:
                  subWinningReportController.detailOrSummaryList.map((type) {
                return RadioListTile<String>(
                  title: Text(
                    type,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  value: type,
                  groupValue: Provider.of<SubWinningReportController>(context)
                      .selectedDetailOrSummary,
                  onChanged: (value) {
                    Provider.of<SubWinningReportController>(context,
                            listen: false)
                        .setSelectedDetailOrSummary(value!);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
