import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cars/API/login_api.dart';
import 'package:flutter_cars/api/api_response.dart';
import 'package:flutter_cars/models/user.dart';
import 'package:flutter_cars/pages/home_page.dart';
import 'package:flutter_cars/utils/alert.dart';
import 'package:flutter_cars/utils/navigation.dart';
import 'package:flutter_cars/widgets/app_button.dart';
import 'package:flutter_cars/widgets/app_text.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();

  final _tPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusPassword = FocusNode();

  bool _showProgress = false;

  @override
  void initState() {
    super.initState();

    Future<User> future = User.getFromPreferences();
    future.then((User user) {
      if (user != null)
        setState(() {
          navigate(context, HomePage(), replace: true);
        });
    });
  }

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
            AppText(
              "Login",
              "Digite o login",
              controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusPassword,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Senha",
              "Digite a senha",
              obscureText: true,
              controller: _tPassword,
              validator: _validatePassword,
              keyboardType: TextInputType.number,
              focusNode: _focusPassword,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              "Login",
              onPressed: _onClickLogin,
              showProgress: _showProgress,
            ),
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

  void _onClickLogin() async {
    bool? formOk = _formKey.currentState?.validate();
    if (formOk != true) return;

    String login = _tLogin.text;
    String password = _tPassword.text;

    print("Login: $login, Senha: $password");

    setState(() {
      _showProgress = true;
    });

    ApiResponse<User> apiResponse = await LoginApi.login(login, password);
    if (apiResponse.ok)
      navigate(context, HomePage(), replace: true);
    else {
      alert(context, apiResponse.message);
    }

    setState(() {
      _showProgress = false;
    });
  }
}
