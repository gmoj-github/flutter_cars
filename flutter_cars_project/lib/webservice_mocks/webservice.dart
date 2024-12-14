class Http {
  static String login(String url, {String? body, Map<String, String>? headers}) {
    return '''
      {
        "status": "success",
        "code": 200,
        "message": "User details fetched successfully",
        "data": {
          "user": {
            "name": "Gilson de Oliveira",
            "email": "gilson@gmail.com"
          }
        }
      }
      ''';
  }
}
