import 'package:apptivo/controller/Result/result_controller.dart';
import 'package:apptivo/helper/core/app_spacing.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenResult extends StatefulWidget {
  const ScreenResult({super.key});

  @override
  State<ScreenResult> createState() => _ScreenResultState();
}

class _ScreenResultState extends State<ScreenResult> {
  late ResultController resultController;
  @override
  void initState() {
    resultController = Provider.of<ResultController>(context, listen: false);

    super.initState();
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoring.selctedThemeColor,
        iconTheme: Theme.of(context).iconTheme,
        title: const Text('Winning Numbers',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        actions: [
          IconButton(
              onPressed: () {
                Share.share('Hello');
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(builder: (context, ResultController controller, _) {
          return ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      onTap: () {
                        controller.selectDate(context);
                      },
                      controller: resultController.dateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Date',
                      ),
                    ),
                  ),
                  AppSpacing.ksizedBoxW10,
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
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  AppSpacing.ksizedBoxW10,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColoring.selctedThemeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      final Uri url = Uri.parse(
                          'https://www.youtube.com/live/d5zz5LAFYFs?si=77DuSMNTfo6XT64k');
                      _launchUrl(url);
                    },
                    child: const Text(
                      'Live Results',
                      style: TextStyle(
                          color: AppColoring.kAppWhiteColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              AppSpacing.ksizedBox30,
              const Center(
                child: Text(
                  'Results 1:00 PM',
                  style: TextStyle(
                      color: AppColoring.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              AppSpacing.ksizedBox25,
              resultWidget(
                  color: AppColoring.successPopup, key: 'First', value: '918'),
              resultWidget(
                  color: Colors.blueAccent, key: 'Second', value: '413'),
              resultWidget(
                  color: AppColoring.purpleBgColor, key: 'Third', value: '438'),
              resultWidget(color: Colors.orange, key: 'Fourth', value: '833'),
              resultWidget(
                  color: const Color.fromARGB(255, 32, 10, 111),
                  key: 'Fifth',
                  value: '391'),
              AppSpacing.ksizedBox10,
              const Center(
                child: Text(
                  'COMPLIMENTS',
                  style: TextStyle(
                      color: AppColoring.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  25.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                      crossAxisSpacing: 8.0, // Spacing between columns
                      mainAxisSpacing: 8.0, // Spacing between rows
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 100, // Total number of items
                    itemBuilder: (BuildContext context, int index) {
                      // Return a widget for each item
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal:  25.0),
                        child: Center(
                          child: Text(
                            '${(index+1)*210}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget resultWidget(
      {required Color color, required String key, required String value}) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  key,
                  style: const TextStyle(
                      color: AppColoring.kAppWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: AppColoring.kAppWhiteColor,
          ),
          const Text(
            ':',
            style: TextStyle(
                color: AppColoring.kAppWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          const VerticalDivider(
            color: AppColoring.kAppWhiteColor,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              value,
              style: const TextStyle(
                  color: AppColoring.kAppWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
