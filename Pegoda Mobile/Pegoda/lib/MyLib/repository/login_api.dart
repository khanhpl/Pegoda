import 'dart:convert';

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
      // Map<String, dynamic> responseBody = jsonDecode(response.body);
      // ResToken resToken = ResToken(resToken: responseBody['token']);
      // List<ResToken> list = parseAgents(response.body);
      // print('Status code: ' + response.statusCode.toString());
      // print('response body: ' + response.body.toString());
      // print('response token: ' + resToken.resToken);
      // print('response token: ' + responseBody['token']);
      // print('response token: ' + list[0].resToken.toString());
      // print('token: ' + token);
      if (response.statusCode.toString() == '200') {
        Globals.CheckExistedUser = true;
        if(Globals.CheckExistedUser){
          print('đúng 1');
        }
        return true;
      } else {
        Globals.CheckExistedUser = false;
        return false;
      }
    } finally {}
  }
}
// List<ResToken> parseAgents(String responseBody) {
// final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
// return parsed.map<ResToken>((json) => ResToken.fromJson(json)).toList();
// }

class ResToken {
  var resToken;

  ResToken({required this.resToken});

  factory ResToken.fromJson(Map<dynamic, dynamic> json) {
    return ResToken(
      resToken: json['token'],
    );
  }
}
