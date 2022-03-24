import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import '../globals.dart' as Globals;

class LoginApi {
  Future<bool> checkCurUser(String token) async {
    try {
      var url =
          Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/users/login");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'token': token,
          },
        ),
      );
      if (response.statusCode.toString() == '200') {
        Globals.userEmail = Jwt.parseJwt(response.body)['Email'];
        Globals.customerId = Jwt.parseJwt(response.body)['Id'];
        Globals.userName = Jwt.parseJwt(response.body)['FullName'];
        return true;
      } else {
        return false;
      }
    } finally {}
  }
}

class ResToken {
  var resToken;

  ResToken({required this.resToken});

  factory ResToken.fromJson(Map<dynamic, dynamic> json) {
    return ResToken(
      resToken: json['token'],
    );
  }
}
