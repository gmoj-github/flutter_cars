import 'dart:convert' as converter;

import 'package:flutter_cars/utils/preferences.dart';

class User {
  String? login;
  String? name;
  String? email;
  String? urlPhoto;
  String? token;

  List<String>? roles;

  User.fromJson(Map<String, dynamic> map)
      : login = map['data']['user']['login'],
        name = map['data']['user']['name'],
        email = map['data']['user']['email'],
        urlPhoto = map['data']['user']['urlPhoto'],
        token = map['data']['user']['token'],
        roles  = getRoles(map);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['data'] = {};
    data['data']['user'] = {};
    data['data']['user']['login'] = this.login;
    data['data']['user']['name'] = this.name;
    data['data']['user']['email'] = this.email;
    data['data']['user']['urlPhoto'] = this.urlPhoto;
    data['data']['user']['token'] = this.token;
    data['data']['user']['roles'] = this.roles;
    return data;
  }

  static getRoles(Map<String, dynamic> map) {
    List? roles = map['data']['user']['roles'];
    return (roles ?? []).map((role) => role.toString()).toList();
  }

  void saveOnPreferences(){
    Map userMap = toJson();
    String json = converter.json.encode(userMap);
    Preferences.setString("user.prefs", json);
  }

  static Future<User> getFromPreferences() async {
    String userPrefs = await Preferences.getString("user.prefs");
    Map<String, dynamic> userMap = converter.json.decode(userPrefs);
    return User.fromJson(userMap);
  }

  @override
  String toString() {
    return 'User{login: $login, name: $name, email: $email, urlPhoto: $urlPhoto, token: $token, roles: $roles}';
  }
}
