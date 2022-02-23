import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  Future<bool> checkCurUser(String email) async {
    var url = Uri.parse(
        'https://pegoda.azurewebsites.net/swagger/api/v1.0/user/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );
    print('email: ' + email);
    print('Status code: ' + response.statusCode.toString());
    print('token: ' + response.body);
    print('response: ' + response.toString());
    if (response.statusCode == 400) {
      return false;
    }
    return true;
  }
}
