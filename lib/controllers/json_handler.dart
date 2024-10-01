import 'dart:convert';

class JSONHandler {
  static final JSONHandler _jsonHandler = JSONHandler._internal();
  factory JSONHandler() {
    return _jsonHandler;
  }
  JSONHandler._internal();

  Future<String> login(
      String email, String password, String name, String photo) async {
    Map<String, String> parameters = {
      "mail": email,
      "password": password,
      "name": name,
      "photo": photo,
    };
    return jsonEncode(parameters);
  }

  Future<String> accestoken(
    String token,
  ) async {
    Map<String, String> parameters = {
      "token": token,
    };
    return jsonEncode(parameters);
  }
}
