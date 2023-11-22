import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  void showPassword() {
    if (obscureText == true) {
      obscureText = false;
    } else {
      obscureText = true;
    }
    update();
  }

  bool validateInput() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      update();
      return true;
    } else {
      autovalidateMode = AutovalidateMode.always;
      update();
      return false;
    }
  }

  String isEmail(String em) {
    if(!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(em)){
      return 'Invalid Email';
    }
    return '';
  }
}
