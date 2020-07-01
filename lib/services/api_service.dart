import 'dart:convert';

import 'package:http/http.dart' as http;

///A class to fetch data from APIs
class ApiService {
  ApiService._();

  ///A method to GET data and return as Map
  static Future<Map<String, dynamic>> get(String url) async {
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    }
    return null;
  }
}
