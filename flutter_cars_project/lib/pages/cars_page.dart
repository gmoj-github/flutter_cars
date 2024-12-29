import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cars/models/car.dart';

class CarsPage extends StatelessWidget {
  Car car;

  CarsPage(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          car.name!,
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Image.asset(car.urlPhoto!),
    );
  }
}
