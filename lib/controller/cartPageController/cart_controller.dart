import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/profile/profilePage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
class CartController extends GetxController {
  double totalPrice = 0.0;
  // List<Product> cartProducts = [];
  Future<bool> createOrder(
      List<Map<String, dynamic>> order, String token) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$kBaseUrl/v1/orders'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(
          <String, dynamic>{
            "products": order,
          },
        ),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        Get.snackbar("Successfully Added", "Your order Sent Successfully ");
        return true;
      } else {
        Get.snackbar("Successfully Added", "Your order Sent Successfully ");
        return false;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
      );
      print(e);
      return false;
    }
  }

  void initTotalPrice() {
    for (var i = 0; i < cartProducts.length; i++) {
      totalPrice += cartProducts[i].price!;
      // ignore: avoid_print
      print('init total price done');
    }
  }

  List<Map<String, dynamic>> initApiRes() {
    List<Map<String, dynamic>> result = [];
    for (var i = 0; i < cartProducts.length; i++) {
      result.add({'product_id': cartProducts[i].id, "quantity": counters[i]});
    }
    return result;
  }

  ////all above for api integration
  bool togglePassword = true;
  bool togglePassword1 = true;
  int counter1 = 1;
  int counter2 = 1;
  bool selectedArr = true;
  String currentLanguage = languagesList[0];
  bool selectedSwitch = false;

  void getTotal() {
    for (var i = 0; i < cartProducts.length; i++) {
      totalPrice += cartProducts[i].price!;
    }
  }

  List<int> counters = [];

  void addCounterList(int size) {
    for (var i = 0; i < size; i++) {
      counters.add(1);
    }
  }

  void increment(int i) {
    counters[i]++;
    totalPrice += cartProducts[i].price!;
    update();
  }

  void decrement(int i) {
    if (counters[i] > 1) {
      counters[i]--;
      totalPrice -= cartProducts[i].price!;
      if (cartProducts.isEmpty) {
        totalPrice = 0;
      }
      update();
    }
  }

  void remove(int i) {
    totalPrice = totalPrice - (cartProducts[i].price! * counters[i]);
    cartProducts.removeAt(i);
    if (cartProducts.isEmpty) {
      totalPrice = 0;
    }
    update();
  }

  void togglePas() {
    togglePassword = !togglePassword;
    update();
  }

  void togglePas1() {
    togglePassword1 = !togglePassword1;
    update();
  }

  void changeArr() {
    selectedArr = !selectedArr;
    update();
  }

  void changeSwitch() {
    selectedSwitch = !selectedSwitch;
    update();
  }
  
}
