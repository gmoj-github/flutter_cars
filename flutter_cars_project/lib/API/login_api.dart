import 'dart:convert';

import 'package:flutter_cars/models/user.dart';
import 'package:http/http.dart' as http;

import '../webservice_mocks/webservice.dart';

class LoginApi {
  static Future<User?> login(String login, String password) async {
    if (login != "admin" && password != "pass") return null;

    var url = "https://";
    Map<String, String> headers = {
      "Content-Type": "application/json"
    };

    Map params = {
      "username": login,
      "password": password
    };

    var body = json.encode(params);

    var responseBody = Http.login(url, body: body, headers: headers);
    Map<String, dynamic> response = json.decode(responseBody);

    final user = User.fromJson(response);

    return user;
  }
}
