import 'package:apptivo/controller/game_change_controller.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenGameChange extends StatefulWidget {
  const ScreenGameChange({super.key});

  @override
  State<ScreenGameChange> createState() => _ScreenGameChangeState();
}

class _ScreenGameChangeState extends State<ScreenGameChange> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Consumer(
        builder: (context,GameChangeController value,_) {
          return Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    value.changeColor(color: AppColoring.redBgColor, context: context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColoring.redBgColor,
                    child: const Center(child: Text('01 PM',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
               Expanded(
                child: InkWell(
                  onTap: () {
                    value.changeColor(color: AppColoring.greenBgColor, context: context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColoring.greenBgColor,
                    child: const Center(child: Text('03 PM',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
               Expanded(
                child: InkWell(
                  onTap: () {
                    value.changeColor(color: AppColoring.purpleBgColor, context: context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColoring.purpleBgColor,
                    child: const Center(child: Text('06 PM',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),),
                  ),
                ),
              ),
               Expanded(
                child: InkWell(
                  onTap: () {
                    value.changeColor(color: AppColoring.blackBgColor, context: context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColoring.blackBgColor,
                    child: const Center(child: Text('08 PM',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: AppColoring.kAppWhiteColor),),),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}