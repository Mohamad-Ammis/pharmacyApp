import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:pharmacy/constans.dart';

class DeleteProduct{

  Future<void>deleteProduct(String token,String productId)async {

    try {
      http.Response response = await http.delete(
          Uri.parse('$kBaseUrl/v1/products/${productId}'),
          headers: {"Authorization": "Bearer $token","Accept":'application/json'});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('delete Products Successfully');
        Get.snackbar('Deleted Successfully', data['message']);
        return jsonDecode(response.body);
      } else {
        //print("Error When Get All Products");
        print(response.body);
        var data=jsonDecode(response.body);
        Get.snackbar('Error Happened', data['message'],);
        //throw Exception('Error When delete Products');
      }
    } on Exception catch (e) {
      print(e.toString());
    }

  }
}