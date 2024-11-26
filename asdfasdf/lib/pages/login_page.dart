import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cars"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          _text("Login", "Digite o login", controller: _tLogin),
          SizedBox(
            height: 10,
          ),
          _text("Senha", "Digite a senha", obscureText: true, controller: _tPassword),
          SizedBox(
            height: 20,
          ),
          _button("Login", _onClickLogin),
        ],
      ),
    );
  }

  Container _button(text, onPressed) {
    return Container(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
        ),
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          textStyle: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  Widget _text(label, hint, {obscureText = false, controller}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.grey,
        ),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16),
      ),
    );
  }

  void _onClickLogin() {
    String login = _tLogin.text;
    String password = _tPassword.text;

    print("Login: $login, Senha: $password");
  }
}
