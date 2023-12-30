import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy/constans.dart';

class GetAllProducts extends GetxController {
  dynamic data;
  dynamic categoryData;
  Map<int, bool> favoriteProducts = {};

  Future<dynamic> getByCategory(String token, String category) async {
    dynamic response = await http.get(
        Uri.parse(
            '$kBaseUrl/v1/products/search?category=$category&start=0&limit=10'),
        headers: {"Authorization": "Bearer $token"});
    categoryData = jsonDecode(response.body);
    print(categoryData);
    return jsonDecode(response.body);
  }

  Future<dynamic> getAllProducts(String token) async {
    try {
      http.Response response = await http.get(
          Uri.parse('$kBaseUrl/v1/products'),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        print('Get All Products Successfully');
        update();
        return jsonDecode(response.body);
      } else {
        //print("Error When Get All Products");
        throw Exception('Error When Get All Products');
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> getMostCommonProducts(String token) async {
    dynamic response = await http.get(
        Uri.parse('$kBaseUrl/v1/product/mostCommon'),
        headers: {"Authorization": "Bearer $token"});
    data = jsonDecode(response.body);
    return jsonDecode(response.body);
  }
}
