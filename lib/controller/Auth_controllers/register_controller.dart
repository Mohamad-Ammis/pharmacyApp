import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;
import 'package:flutter_application_2/constans.dart';

class RegisterController extends GetxController {
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;
  String? name;

  Future<void> register(String phone, String password, String confirmPassword,
      String name, String email) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$kBaseUrl/v1/createuser'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'phone': phone,
          'password': password,
          "email": email,
          "password_confirmation": confirmPassword,
          "name": name,
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status'] == true) {
        Get.snackbar(
            "Register Success", "You have been Registered Successfully");
        Get.offAllNamed('/login');
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
      Get.snackbar("Error Happened", e.toString());
    }
  }
}
