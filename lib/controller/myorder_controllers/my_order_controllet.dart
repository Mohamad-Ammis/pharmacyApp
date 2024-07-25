import 'dart:convert';

import 'package:flutter_application_2/constans.dart';
import 'package:get/get.dart';
import'package:http/http.dart 'as http;
class MyOrderController extends GetxController{

  Future<dynamic>getAllOrders(String token)async {
    try {
  http.Response response=await http.get(
    Uri.parse('$kBaseUrl/v1/orders/'),
    headers: <String, String>{
        'Content-Type': 'application/json',
         "Authorization": "Bearer $token"
      },
  );
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    print(data);
    return data;
  }
  else{
    return false;
  }
} on Exception catch (e) {
  Get.snackbar('Exception Happened',e.toString());
  return false;
}
  }
}