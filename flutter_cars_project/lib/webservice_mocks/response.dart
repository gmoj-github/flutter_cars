import 'package:flutter_cars/webservice_mocks/response_type.dart';

class Response {

  late ResponseType statusCode;
  late String body;

  Response({required this.statusCode, required this.body});
}