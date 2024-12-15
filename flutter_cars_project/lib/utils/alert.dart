import 'package:flutter/material.dart';

alert(BuildContext context, String message) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          onPopInvokedWithResult: (didPop, result) async {
            return;
          },
          child: AlertDialog(
            title: Text("Carros"),
            content: Text(message),
            actions: [
              TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        );
      });
}
