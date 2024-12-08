import 'package:flutter/material.dart';

Future navigate(context, page) {
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}
