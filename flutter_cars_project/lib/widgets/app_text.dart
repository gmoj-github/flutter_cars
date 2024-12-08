import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String label;
  String hint;
  bool obscureText;
  TextEditingController? controller;
  FormFieldValidator? validator;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  FocusNode? nextFocus;

  AppText(
    this.label,
    this.hint, {
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onFieldSubmitted: (String text) {
          if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 25,
            color: Colors.grey,
          ),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
