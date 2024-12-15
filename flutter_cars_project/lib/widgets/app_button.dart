import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  VoidCallback? onPressed;
  bool showProgress;

  AppButton(this.text, {this.onPressed, this.showProgress = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: ElevatedButton(
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            : Text(
                text,
              ),
        onPressed: onPressed,
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
