import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/helper/api.dart';
import 'package:pharmacy/helper/show_dialog.dart';
import 'package:pharmacy/main.dart';

class LoginController extends GetxController {
  BuildContext? con;
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  String? phone;
  String? password;
  
  Api api = Api();
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
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(em)) {
      return 'Invalid Email';
    }
    return '';
  }

  Future<void> login(String phone,String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$kBaseUrl/v1/login'),
        headers: <String, String>{
          'Content-Type': kContentApiType,
        },
        body: jsonEncode(<String, dynamic>{'phone':phone,'password':password}),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status'] == true) {
        showSuccessDialog(con!, 'Login Success', "Welcome To Our World");
        await Future.delayed(const Duration(seconds: 3));
        shared.setString('token', data['token'].toString());
        Get.offAllNamed("/HomePage");
      } else {
        if(data['errors']==null){
        showErrorDialog(con!, "Error Happened", data['message']);
        }
        else if (data['errors']['phone'] == null) {
          showErrorDialog(con!, "Error Happened", data['errors']['password'][0]);
        } else if (data['errors']['password'] == null) {
          showErrorDialog(con!, "Error Happened", data['errors']['phone'][0]);
        } else {
          showErrorDialog(
              con!,
              "Error Happened",
              data['errors']['phone'][0] +
                  "\n" +
                  data['errors']['password'][0]);
        }
      }
    } catch (e) {
      showErrorDialog(con!, "Error Happened", 'Some Thing Went Wrong');
    }
  }
}
