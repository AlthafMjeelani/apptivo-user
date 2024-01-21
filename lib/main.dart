import 'package:apptivo/helper/core/app_constant.dart';
import 'package:apptivo/helper/core/state_controller.dart';
import 'package:apptivo/view/authentication/login_screen.dart';
import 'package:apptivo/view/home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderStateController.providers,
      child: MaterialApp(
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          // primaryTextTheme:
          //     const TextTheme(headlineLarge: TextStyle(color: Colors.white)),
          // scaffoldBackgroundColor:
          //     Colors.white, // Set the background color to white
          // textTheme: const TextTheme(
          //   bodyLarge:
          //       TextStyle(color: Colors.white), // Set text color to white
          // ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        home: const ScreenLogin(),
      ),
    );
  }
}
