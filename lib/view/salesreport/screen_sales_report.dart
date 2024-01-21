import 'package:apptivo/controller/salesreport/sales_report_controller.dart';
import 'package:apptivo/helper/core/app_spacing.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:apptivo/utility/utils.dart';
import 'package:apptivo/widgets/common_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSalesRepeort extends StatefulWidget {
  const ScreenSalesRepeort({super.key});

  @override
  State<ScreenSalesRepeort> createState() => _ScreenSalesRepeortState();
}

class _ScreenSalesRepeortState extends State<ScreenSalesRepeort> {
  late SalesReportController salesReportController;
  @override
  void initState() {
    salesReportController =
        Provider.of<SalesReportController>(context, listen: false);
    salesReportController.startDateController.text =
        Utils.convertToReadableDate(DateTime.now().toString());

    salesReportController.endDateController.text =
        Utils.convertToReadableDate(DateTime.now().toString());
        salesReportController.timmingController.text='All';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: bottonActionButtions(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: AppColoring.selctedThemeColor,
        iconTheme: Theme.of(context).iconTheme,
        title: const Text(
            'Sales Report',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      body: Consumer(builder: (context, SalesReportController controller, _) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: 0,
                        groupValue: Provider.of<SalesReportController>(context)
                            .selectedRadio,
                        onChanged: (value) {
                          Provider.of<SalesReportController>(context,
                                  listen: false)
                              .setSelectedRadio(value ?? 0);
                        },
                      ),
                      const Text('All'),
                      Radio(
                        value: 1,
                        groupValue: Provider.of<SalesReportController>(context)
                            .selectedRadio,
                        onChanged: (value) {
                          Provider.of<SalesReportController>(context,
                                  listen: false)
                              .setSelectedRadio(value ?? 1);
                        },
                      ),
                      const Text('1'),
                      Radio(
                        value: 2,
                        groupValue: Provider.of<SalesReportController>(context)
                            .selectedRadio,
                        onChanged: (value) {
                          Provider.of<SalesReportController>(context,
                                  listen: false)
                              .setSelectedRadio(value ?? 2);
                        },
                      ),
                      const Text('2'),
                      Radio(
                        value: 3,
                        groupValue: Provider.of<SalesReportController>(context)
                            .selectedRadio,
                        onChanged: (value) {
                          Provider.of<SalesReportController>(context,
                                  listen: false)
                              .setSelectedRadio(value ?? 3);
                        },
                      ),
                      const Text('3'),
                    ],
                  ),
                ),
                AppSpacing.ksizedBoxW40,
              ],
            ),
            const SizedBox(height: 5),
            const Divider(),
            AppSpacing.ksizedBox5,
            Row(
              children: [
                controller.selectedRadio == 1
                    ? Row(
                        children: [
                          Checkbox(
                            value: controller.selectedCheckboxes.contains('A'),
                            onChanged: (value) {
                              controller.toggleCheckbox('A');
                            },
                          ),
                          const Text('A'),
                          Checkbox(
                            value: controller.selectedCheckboxes.contains('B'),
                            onChanged: (value) {
                              controller.toggleCheckbox('B');
                            },
                          ),
                          const Text('B'),
                          Checkbox(
                            value: controller.selectedCheckboxes.contains('C'),
                            onChanged: (value) {
                              controller.toggleCheckbox('C');
                            },
                          ),
                          const Text('C'),
                        ],
                      )
                    : controller.selectedRadio == 2
                        ? Row(
                            children: [
                              Checkbox(
                                value: controller.selectedCheckboxes
                                    .contains('AB'),
                                onChanged: (value) {
                                  controller.toggleCheckbox('AB');
                                },
                              ),
                              const Text('AB'),
                              Checkbox(
                                value: controller.selectedCheckboxes
                                    .contains('AC'),
                                onChanged: (value) {
                                  controller.toggleCheckbox('AC');
                                },
                              ),
                              const Text('AC'),
                              Checkbox(
                                value: controller.selectedCheckboxes
                                    .contains('BC'),
                                onChanged: (value) {
                                  controller.toggleCheckbox('BC');
                                },
                              ),
                              const Text('BC'),
                            ],
                          )
                        : controller.selectedRadio == 3
                            ? Row(
                                children: [
                                  Checkbox(
                                    value: controller.selectedCheckboxes
                                        .contains('S'),
                                    onChanged: (value) {
                                      controller.toggleCheckbox('S');
                                    },
                                  ),
                                  const Text('Super'),
                                  Checkbox(
                                    value: controller.selectedCheckboxes
                                        .contains('BOX'),
                                    onChanged: (value) {
                                      controller.toggleCheckbox('BOX');
                                    },
                                  ),
                                  const Text('Box'),
                                ],
                              )
                            : AppSpacing.ksizedBox2,
                AppSpacing.ksizedBoxW40,
                controller.selectedRadio != 0
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,

                            // controller: salesReportController.startDateController,
                            decoration:
                                const InputDecoration(hintText: 'Number'),
                          ),
                        ),
                      )
                    : AppSpacing.ksizedBox0
              ],
            ),
            controller.selectedRadio != 0
                ? AppSpacing.ksizedBox10
                : AppSpacing.ksizedBox0,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Consumer(builder:
                  (context, SalesReportController salesReportController, _) {
                return Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.w500),

                      readOnly: true,
                      //   enabled: false,
                      onTap: () {
                        salesReportController.selectDate(context,
                            isStart: true);
                      },
                      controller: salesReportController.startDateController,
                      decoration: const InputDecoration(hintText: 'Start Date'),
                    )),
                    AppSpacing.ksizedBoxW20,
                    Expanded(
                        child: TextFormField(
                      onTap: () {
                        salesReportController.selectDate(context,
                            isStart: false);
                      },
                      readOnly: true,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      controller: salesReportController.endDateController,
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
                Column(
                  children: [
                    Switch(
                      
                      value: controller.switchValue, // Placeholder for switch value
                      onChanged: (bool value) {
                        controller.setSwitchValue(value);
                      },
                    ),
                    const Text('Expand')
                  ],
                ),
                AppSpacing.ksizedBoxW40,
                Expanded(
                  child: TextField(
                    onTap: () {
                    _showPopup(context);
                  },
                    textAlign: TextAlign.center,
                    controller: salesReportController.timmingController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: 'Time',
                    ),
                  ),
                ),AppSpacing.ksizedBoxW40,
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColoring.selctedThemeColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      // Handle button click
                    },
                    child: const Text('Search',style: TextStyle(color: AppColoring.kAppWhiteColor,fontSize: 15,fontWeight: FontWeight.bold),),
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
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'Dealer',
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'Bill',
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'Count',
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'D.Amount',
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'C.Amount',
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
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
                              'aa',
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
                            const DataCell(Text(
                              '12',
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

  Widget bottonActionButtions() {
    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('COUNT'),
                  Text(''),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('CAMOUNT'),
                  Text(''),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('DAMOUNT'),
                  Text(''),
                ],
              ),
            ),
          ),
        ],
      ),
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
            mainAxisSize: MainAxisSize.min, // Set this to minimize the dialog size
            children: [
              RadioListTile<String>(
                title: const Text('All',   style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),),
                value: 'All',
                groupValue: Provider.of<SalesReportController>(context).selectedOption,
                onChanged: (value) {
                  Provider.of<SalesReportController>(context, listen: false)
                      .setSelectedOption(value!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('1:00PM',   style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),),
                value: '1:00PM',
                groupValue: Provider.of<SalesReportController>(context).selectedOption,
                onChanged: (value) {
                  Provider.of<SalesReportController>(context, listen: false)
                      .setSelectedOption(value!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('6:00PM',   style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),),
                value: '6:00PM',
                groupValue: Provider.of<SalesReportController>(context).selectedOption,
                onChanged: (value) {
                  Provider.of<SalesReportController>(context, listen: false)
                      .setSelectedOption(value!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('KL',   style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),),
                value: 'KL',
                groupValue: Provider.of<SalesReportController>(context).selectedOption,
                onChanged: (value) {
                  Provider.of<SalesReportController>(context, listen: false)
                      .setSelectedOption(value!);
                  Navigator.pop(context);
                },
              ),
                RadioListTile<String>(
                title: const Text('8:00PM',   style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),),
                value: '8:00PM',
                groupValue: Provider.of<SalesReportController>(context).selectedOption,
                onChanged: (value) {
                  Provider.of<SalesReportController>(context, listen: false)
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
