import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _text(
              "Login",
              "Digite o login",
              controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 10,
            ),
            _text(
              "Senha",
              "Digite a senha",
              obscureText: true,
              controller: _tPassword,
              validator: _validatePassword,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            _button("Login", _onClickLogin),
          ],
        ),
      ),
    );
  }

  String? _validatePassword(text) {
    if (text?.isEmpty == true) return "Digite a senha";
    return null;
  }

  String? _validateLogin(text) {
    if (text?.isEmpty == true) return "Digite o login";
    return null;
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

  Widget _text(
    label,
    hint, {
    obscureText = false,
    controller,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
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
    bool? formOk = _formKey.currentState?.validate();
    if (formOk != true) return;

    String login = _tLogin.text;
    String password = _tPassword.text;

    print("Login: $login, Senha: $password");
  }
}
