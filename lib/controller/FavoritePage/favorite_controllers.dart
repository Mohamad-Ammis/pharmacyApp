import 'dart:convert';

import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FavoriteController extends GetxController {
  RxInt counter=5.obs;
  List<Product> favoriteProducts = [];
  Future<bool> handleFavoritesProduct(int id, String token) async {
    http.Response response = await http.post(
      Uri.parse('$kBaseUrl/v1/favorites/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{"product_id": "5"}),
    );
    dynamic data = jsonDecode(response.body);
     print(response.body);
    if (data['is_favorite']['attached'].toString().isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isFavoritesProduct(int id, String token) async {
    try {
  http.Response response = await http.get(
    Uri.parse('$kBaseUrl/v1/products/$id/isfav'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token"
    },
  );
  dynamic data = jsonDecode(response.body);
    print('jkasa$data');
  if (data['status'] == true) {
    if(data['isfavorite']==true){
      update();
    return true;
    }
    else {
      update();
      return false;
    }
  } else {
    update();
    return false;
  }
} on Exception catch (e) {
  return false;
}
  }

Future<dynamic> getFavoriteProducts(String token) async {
  try {
    dynamic response = await http.get(Uri.parse('$kBaseUrl/v1/favorites/'),
        headers: {"Authorization": "Bearer $token"});
    dynamic data = jsonDecode(response.body);
   // print(data);
    return data;
  } on Exception catch (e) {
    print(e);
  }
}
}
