import 'dart:convert';

import 'package:flutter_cars/api/api_response.dart';
import 'package:flutter_cars/models/user.dart';
import 'package:flutter_cars/webservice_mocks/response_type.dart';
import 'package:http/http.dart' as http;

import '../webservice_mocks/webservice.dart';

class LoginApi {
  static Future<ApiResponse<User>> login(String login, String password) async {
    try{
      var url = "https://";
      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {"username": login, "password": password};

      var body = json.encode(params);

      var httpResponse = await Http.login(url, headers: headers, body: body, success: true);
      Map<String, dynamic> mapResponse = json.decode(httpResponse.body);
      if (httpResponse.statusCode == ResponseType.Success) {
        final user = User.fromJson(mapResponse);
        user.saveOnPreferences();

        return  ApiResponse.ok(user);
      }

      return ApiResponse<User>.error(mapResponse['message']);
    }
    catch(error, exception)
    {
      print("Login error -> $error > $exception");
    }

    return ApiResponse.error("Servidor indisponível.");
  }
}
