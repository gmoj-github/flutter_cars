import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  VoidCallback? onPressed;

  AppButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
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
}
