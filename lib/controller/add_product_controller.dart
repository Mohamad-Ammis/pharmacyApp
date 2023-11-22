import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  bool nextToArabicForm = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

void updateUi(){
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
}
