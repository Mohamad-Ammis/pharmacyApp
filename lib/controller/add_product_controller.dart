import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  bool nextToArabicForm = false;
  GlobalKey<FormState> formKey = GlobalKey();
  double localWidth=0;
  double fullScreenWidth=0;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
}
