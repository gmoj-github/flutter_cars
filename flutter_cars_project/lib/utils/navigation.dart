import 'package:flutter/material.dart';

Future navigate(context, page, {bool replace = false}) {
  if (replace) {
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  } else {
    return Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }
}
