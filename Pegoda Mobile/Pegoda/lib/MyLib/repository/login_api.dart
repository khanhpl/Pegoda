import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  Future<bool> checkCurUser(String email) async {
    try {
      var url = Uri.parse(
          "https://pegoda.azurewebsites.net/api/v1.0/users/login");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'email': email,
          },
        ),
      );
      if (response.statusCode.toString() == '200') {
        return true;
      }
      print('Sai nè');
      return false;
    } finally {}
  }
}
