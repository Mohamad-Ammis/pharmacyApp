import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pharmacy/constans.dart';
class GetAllOrders {
    Future<dynamic> getAllOrders(String token) async {
    dynamic response = await http.get(
        Uri.parse(
            '$kBaseUrl/v1/orders/'),
        headers: {"Authorization": "Bearer $token"});
    dynamic data = jsonDecode(response.body);
    print(data);
    return jsonDecode(response.body);
  }
}