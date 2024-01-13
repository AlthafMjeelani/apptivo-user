import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
    TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

    bool passwordShow = true;
  void changepasswodVisibility() {
    passwordShow = !passwordShow;
    notifyListeners();
  }

}