import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pharmacy/constans.dart';

class ChangeOrderState{


  Future<dynamic> sendOrder(String token, String id) async {
    dynamic response = await http.patch(
        Uri.parse(
            '$kBaseUrl/v1/orders/$id/send'),
        headers: {"Authorization": "Bearer $token"});
    dynamic data = jsonDecode(response.body);
    print(data);
    return jsonDecode(response.body);
  }
  Future<dynamic> receivedOrder(String token, String id) async {
    dynamic response = await http.patch(
        Uri.parse(
            '$kBaseUrl/v1/orders/$id/receive'),
        headers: {"Authorization": "Bearer $token"});
    dynamic data = jsonDecode(response.body);
    print(data);
    return jsonDecode(response.body);
  }
  Future<dynamic> payOrder(String token, String id) async {
    dynamic response = await http.patch(
        Uri.parse(
            '$kBaseUrl/v1/orders/$id/bill/pay'),
        headers: {"Authorization": "Bearer $token"});
    dynamic data = jsonDecode(response.body);
    print(data);
    return jsonDecode(response.body);
  }

}