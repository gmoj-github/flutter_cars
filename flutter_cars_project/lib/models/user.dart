class User {
  String? login;
  String? name;
  String? email;
  String? token;

  List<String>? roles;

  User.fromJson(Map<String, dynamic> map)
      : name = map['data']['user']['name'],
        email = map['data']['user']['email'];

  @override
  String toString() {
    return "Usuário{login: $login, nome: $name, email: $email, token: $token";
  }
}
