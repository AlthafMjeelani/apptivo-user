
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          padding: const EdgeInsets.all(0.0),
          backgroundColor: AppColoring.buttonColor,
          textStyle: const TextStyle(color: AppColoring.kAppColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: AppColoring.kAppWhiteColor,
          ),
        ),
      ),
    );
  }
}



class CommonOptionButtonWidget extends StatelessWidget {
  const CommonOptionButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
          padding: const EdgeInsets.all(0.0),
          backgroundColor: AppColoring.selctedThemeColor,
          textStyle: const TextStyle(color: AppColoring.kAppColor),
        ),
        onPressed: onPressed,

        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(  horizontal:  8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColoring.kAppWhiteColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
            
                Icon(Icons.keyboard_arrow_right_outlined,color: AppColoring.kAppWhiteColor,)
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}

class CommonSelectionButtonWidget extends StatelessWidget {
  const CommonSelectionButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          padding: const EdgeInsets.all(0.0),
          backgroundColor: AppColoring.buttonColor,
          textStyle: const TextStyle(color: AppColoring.kAppColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: AppColoring.kAppWhiteColor,
          ),
        ),
      ),
    );
  }
}


