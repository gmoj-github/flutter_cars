import 'package:flutter_cars/webservice_mocks/response.dart';
import 'package:flutter_cars/webservice_mocks/response_type.dart';

class Http {
  static Future<Response> login(String url,
      {String? body, Map<String, String>? headers, bool success = true}) async {

    // Simulating request time
    await Future.delayed(const Duration(seconds: 1));

    if (success) {
      return Response(statusCode: ResponseType.Success, body: '''
          {
            "statusCode": 200,
            "message": "User details fetched successfully",
            "data": {
              "user": {
                "login": "GilsonOliveira",
                "name": "Gilson Medeiros de Oliveira Junior",
                "email": "gilson@gmail.com",
                "urlPhoto": "assets/user.png",
                "token": "klLAJds0SJDALKJDlAJSDLKJQj0lksadjlkasjd0093",
                "roles": ["ADMIN","USER"]
              }
            }
          }
          ''');
    } else {
      return Response(statusCode: ResponseType.Forbidden, body: _forbidden());
    }
  }

  static Future<Response> getCars(String url,
      {String? body, Map<String, String>? headers, bool success = true}) async {

    // Simulating request time
    await Future.delayed(const Duration(seconds: 1));

    if (success) {
      return Response(statusCode: ResponseType.Success, body: '''
          {
            "statusCode": 200,
            "message": "Success",
            "data": {
              "cars": [
                {
                  "name": "HB20S",
                  "urlPhoto": "assets/hb20s.png"
                },
                {
                  "name": "Nissan Kicks",
                  "urlPhoto": "assets/kicks.png"
                },
                {
                  "name": "Tracker",
                  "urlPhoto": "assets/tracker.png"
                }
              ]
            }
          }
          ''');
    } else {
      return Response(statusCode: ResponseType.Forbidden, body: _forbidden());
    }
  }

  static String _forbidden() {
    return '''
    {
      "statusCode": 403,
      "message": "Você não tem permissão para acessar esse webservice!"
    }
    ''';
  }
}
