import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/constans.dart';

class LoginController extends GetxController {
  BuildContext? con;
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  String? phone;
  String? password;

  void showPassword() {
    if (obscureText == true) {
      obscureText = false;
    } else {
      obscureText = true;
    }
    update();
  }

  Future<void> login(String phone, String password) async {
    try {
      print('in');
      http.Response response = await http.post(
        Uri.parse('$kBaseUrl/v1/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
            jsonEncode(<String, dynamic>{'phone': phone, 'password': password,'fcm_token':fcmToken}),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      print('object');
      if (data['status'] == true) {
        // sharedPref.setString('token', data['token'].toString());
        // print(sharedPref.getString('token'));
        var data=jsonDecode(response.body);
        print(data);
        Get.snackbar("LogIn Success", "You have been Loggedin Successfully");
        token=data['token'];
        Get.offAllNamed('/MainPage');
      } else {
        if (data['errors'] == null) {
          Get.snackbar(
            "Error Happened",
            data['message'],
          );
        } else if (data['errors']['phone'] == null) {
          Get.snackbar("Error Happened", data['errors']['password']);
        } else if (data['errors']['password'] == null) {
          Get.snackbar("Error Happened", data['errors']['phone']);
        } else {
          Get.snackbar(
              "Error Happened",
              data['errors']['phone'][0] +
                  "\n" +
                  data['errors']['password'][0]);
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Happened", e.toString());
    }
  }
Future<void>logout(String s)async {
try {
      print('in');
      http.Response response = await http.post(
        Uri.parse('$kBaseUrl/v1/logout'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $s',
        },
      );
      if(response.statusCode==200){
        print(jsonDecode(response.body));
      }
      else{
        var data=jsonDecode(response.body);
        print(jsonDecode(response.body));

      }
}catch(e){
  print(e.toString());
}
}
}
