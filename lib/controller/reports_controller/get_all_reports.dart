import 'dart:convert';

import 'package:flutter_application_2/constans.dart';
import 'package:http/http.dart'as http;
class GetAllReports{
    Future<dynamic> getAllReports(String token) async {
    dynamic response = await http.get(
        Uri.parse(
            '$kBaseUrl/v1/orders/report'),
        headers: {"Authorization": "Bearer $token"});
    dynamic data  = jsonDecode(response.body);
    print(data);
    return jsonDecode(response.body);
  }
}