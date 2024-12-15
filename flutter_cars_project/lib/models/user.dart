class User {
  String? login;
  String? name;
  String? email;
  String? token;

  List<String>? roles;

  User.fromJson(Map<String, dynamic> map)
      : login = map['data']['user']['login'],
        name = map['data']['user']['name'],
        email = map['data']['user']['email'],
        token = map['data']['user']['token'],
        roles  = getRoles(map);

  static getRoles(Map<String, dynamic> map) {
    List? roles = map['data']['user']['roles'];
    return (roles ?? []).map((role) => role.toString()).toList();
  }

  @override
  String toString() {
    return "Usuário{login: $login, nome: $name, email: $email, token: $token, roles: $roles";
  }
}
