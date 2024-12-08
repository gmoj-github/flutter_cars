import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String password) async {
    if (login == "admin" && password == "pass") return true;
    return false;
  }
}