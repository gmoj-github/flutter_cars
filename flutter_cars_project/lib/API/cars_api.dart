import 'dart:convert';

import 'package:flutter_cars/api/api_response.dart';
import 'package:flutter_cars/models/car.dart';
import 'package:flutter_cars/webservice_mocks/response_type.dart';
import 'package:flutter_cars/webservice_mocks/webservice.dart';

class CarsApi{
  static Future<ApiResponse<List<Car>>> getCars() async {
    var url = "https://";

    var httpResponse = await Http.getCars(url);
    Map<String, dynamic> mapResponse = json.decode(httpResponse.body);
    if (httpResponse.statusCode == ResponseType.Success) {
      final carsMap  = mapResponse['data']['cars'] as List;
      final cars = carsMap.map((car)=> Car.fromJson(car)).toList();
      return ApiResponse<List<Car>>.ok(cars);
    }

    return ApiResponse<List<Car>>.error(mapResponse['message']);
  }
}