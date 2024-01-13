import 'package:apptivo/controller/authentication/login_controller.dart';
import 'package:apptivo/view/gamechange/game_change_screen.dart';
import 'package:apptivo/view/home/screen_home.dart';
import 'package:apptivo/helper/core/app_spacing.dart';
import 'package:apptivo/helper/core/color_constant.dart';
import 'package:apptivo/helper/core/message.dart';
import 'package:apptivo/helper/core/routes.dart';
import 'package:apptivo/widgets/app_loader_widget.dart';
import 'package:apptivo/widgets/common_buttons.dart';
import 'package:apptivo/widgets/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

late LoginController loginController;

class _ScreenLoginState extends State<ScreenLogin> {
  @override
  void initState() {
    loginController = Provider.of<LoginController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loginController.userNameController.clear();
      loginController.passwordController.clear();
      // loginController.isLoadLogin = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.ksizedBox80,
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: AppColoring.black),
                ),
              ],
            ),
            AppSpacing.ksizedBox25,
            const Text(
              'Username',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            textFormFieldWidget('Your username',
                loginController.userNameController, TextInputType.text),
            AppSpacing.ksizedBox10,
            const Text(
              'Password',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            textFormFieldPasswordWidget(
                'Your password',
                loginController.passwordController,
                TextInputType.visiblePassword),
            AppSpacing.ksizedBox20,
            button(),
          ],
        ),
      ),
    );
  }

  Widget textFormFieldWidget(String text, TextEditingController? controller,
      TextInputType? keyboardType) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColoring.primeryBorder),
          borderRadius: BorderRadius.circular(10)),
      child: TextfeildWidget(
        text: text,
        controller: controller,
        keyboardType: keyboardType,
      ),
    );
  }

  Widget textFormFieldPasswordWidget(String text,
      TextEditingController? controller, TextInputType? keyboardType) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColoring.primeryBorder),
          borderRadius: BorderRadius.circular(10)),
      child: Consumer(
        builder: (context, LoginController value, child) {
          return TextfeildWidget(
            obscureText: value.passwordShow,
            text: text,
            controller: controller,
            keyboardType: keyboardType,
            suffixIcon: InkWell(
              onTap: () {
                value.changepasswodVisibility();
              },
              child: Icon(
                value.passwordShow ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget button() {
    return Consumer(
      builder: (context, LoginController value, child) {
        return
            // value.isLoadLogin
            //     ? const LoadreWidget()
            //     :
            CommonButtonWidget(
          text: 'LOGIN',
          onPressed: () {
            // if (value.userNameController.text.isEmpty ||
            //     value.userNameController.text == '') {
            //   showToast(
            //       msg: 'Please enter username  ', clr: AppColoring.errorPopUp);
            // } else {
              RouteConstat.nextNamed(context, const ScreenGameChange());
              // value.loginUser(context);
          //  }
          },
        );
      },
    );
  }
}
