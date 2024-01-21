
import 'package:apptivo/controller/bokking_new/booking_new_controller.dart';
import 'package:apptivo/helper/core/app_spacing.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:apptivo/utility/utils.dart';
import 'package:apptivo/widgets/common_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenBookingNew extends StatelessWidget {
  const ScreenBookingNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: bottonActionButtions(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: AppColoring.selctedThemeColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
            'Sales- 1.00 PM - ${Utils.convertToReadableDate(DateTime.now().toString())}',
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      body: Consumer(builder: (context, BookingNewController controller, _) {
        return ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: Provider.of<BookingNewController>(context)
                            .selectedRadio,
                        onChanged: (value) {
                          Provider.of<BookingNewController>(context, listen: false)
                              .setSelectedRadio(value ?? 1);
                        },
                      ),
                      const Text('1'),
                      Radio(
                        value: 2,
                        groupValue: Provider.of<BookingNewController>(context)
                            .selectedRadio,
                        onChanged: (value) {
                          Provider.of<BookingNewController>(context, listen: false)
                              .setSelectedRadio(value ?? 2);
                        },
                      ),
                      const Text('2'),
                      Radio(
                        value: 3,
                        groupValue: Provider.of<BookingNewController>(context)
                            .selectedRadio,
                        onChanged: (value) {
                          Provider.of<BookingNewController>(context, listen: false)
                              .setSelectedRadio(value ?? 3);
                        },
                      ),
                      const Text('3'),
                    ],
                  ),
                ),
                AppSpacing.ksizedBoxW40,
                Expanded(
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: Provider.of<BookingNewController>(context)
                        .selectedDropdownValue,
                    onChanged: (value) {
                      Provider.of<BookingNewController>(context, listen: false)
                          .setSelectedDropdownValue(value!);
                    },
                    items: [
                      'Book',
                      'Range',
                      'Set',
                      '10s',
                      '100s',
                      '111s',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(hintText: 'Customer'),
                  )),
                  AppSpacing.ksizedBoxW120,
                  Expanded(child: Text('Sub Dealer'))
                ],
              ),
            ),
            AppSpacing.ksizedBox10,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: const TextField(
                      decoration: InputDecoration(hintText: 'Past Tickets Here'),
                    ),
            ),
                  AppSpacing.ksizedBox10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  const Expanded(
                      child: TextField( keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Number'),
                  )),
                  AppSpacing.ksizedBoxW20,
                  const Expanded(
                      child: TextField( keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Count'),
                  )),
                  AppSpacing.ksizedBoxW20,
                  controller.selectedRadio == 3
                      ? const Expanded(
                          child: TextField( keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: 'B Count'),
                        ))
                      : AppSpacing.ksizedBox10,
                ],
              ),
            ),
            AppSpacing.ksizedBox10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: controller.selectedRadio == 1
                  ? Row(
                      children: [
                        Expanded(
                            child: CommonSelectionButtonWidget(
                          text: 'A',
                          onPressed: () {},
                        )),
                        AppSpacing.ksizedBoxW2,
                        Expanded(
                            child: CommonSelectionButtonWidget(
                          text: 'B',
                          onPressed: () {},
                        )),
                        AppSpacing.ksizedBoxW2,
                        Expanded(
                            child: CommonSelectionButtonWidget(
                          text: 'C',
                          onPressed: () {},
                        )),
                        AppSpacing.ksizedBoxW2,
                        Expanded(
                            child: CommonSelectionButtonWidget(
                          text: 'ALL',
                          onPressed: () {},
                        )),
                      ],
                    )
                  : controller.selectedRadio == 2
                      ? Row(
                          children: [
                            Expanded(
                                child: CommonSelectionButtonWidget(
                              text: 'AB',
                              onPressed: () {},
                            )),
                            AppSpacing.ksizedBoxW2,
                            Expanded(
                                child: CommonSelectionButtonWidget(
                              text: 'AC',
                              onPressed: () {},
                            )),
                            AppSpacing.ksizedBoxW2,
                            Expanded(
                                child: CommonSelectionButtonWidget(
                              text: 'BC',
                              onPressed: () {},
                            )),
                            AppSpacing.ksizedBoxW2,
                            Expanded(
                                child: CommonSelectionButtonWidget(
                              text: 'ALL',
                              onPressed: () {},
                            )),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                                child: CommonSelectionButtonWidget(
                              text: 'DEAR',
                              onPressed: () {},
                            )),
                            AppSpacing.ksizedBoxW2,
                            Expanded(
                                child: CommonSelectionButtonWidget(
                              text: 'BOX',
                              onPressed: () {},
                            )),
                            AppSpacing.ksizedBoxW2,
                            Expanded(
                                child: CommonSelectionButtonWidget(
                              text: 'BOTH',
                              onPressed: () {},
                            )),
                          ],
                        ),
            ),
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
                            'Lsk',
                            style: TextStyle(fontSize: 22),
                          )),
                          DataColumn(
                              label: Text(
                            'Number',
                            style: TextStyle(fontSize: 22),
                          )),
                          DataColumn(
                              label: Text(
                            'Count',
                            style: TextStyle(fontSize: 22),
                          )),
                          DataColumn(
                              label: Text(
                            'D.Amount',
                            style: TextStyle(fontSize: 22),
                          )),
                          DataColumn(
                              label: Text(
                            'V.Amount',
                            style: TextStyle(fontSize: 22),
                          )),
                          DataColumn(
                              label: Text(
                            '#',
                            style: TextStyle(fontSize: 22),
                          )),
                        ],
                        rows: List.generate(200, (index) {
                          return DataRow(cells: <DataCell>[
                            DataCell(Text(
                              '${index + 1}',
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                            const DataCell(Text(
                              '2548',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                            const DataCell(Text(
                              '15',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                            const DataCell(Text(
                              '220',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                            const DataCell(Text(
                              '250',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            )),
                            const DataCell(Text(
                              '-',
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
          Expanded(
            child: Container(
              color: AppColoring.selctedThemeColor,
              height: 50,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'SAVE',
                    style: TextStyle(color: AppColoring.kAppWhiteColor),
                  ),
                  Text(
                    '1:00PM',
                    style: TextStyle(color: AppColoring.kAppWhiteColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
