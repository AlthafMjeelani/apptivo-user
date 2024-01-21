import 'package:apptivo/controller/delete_sales/delete_sales_controller.dart';
import 'package:apptivo/helper/core/app_spacing.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenDeleteSales extends StatefulWidget {
  const ScreenDeleteSales({super.key});

  @override
  State<ScreenDeleteSales> createState() => _ScreenDeleteSalesState();
}

class _ScreenDeleteSalesState extends State<ScreenDeleteSales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoring.selctedThemeColor,
        iconTheme: Theme.of(context).iconTheme,
        title: const Text('Delete Sales',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      body: Consumer(builder: (context, DeleteSalesController controller, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Expand',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 16) ,),
                  Switch(
                    value: controller.switchValue, // Placeholder for switch value
                    onChanged: (bool value) {
                      controller.setSwitchValue(value);
                    },
                  ),
                ],
              ),

            IntrinsicWidth(
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
                          'No',
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
            ],
          ),
        );
      }),
    );
  }
}
