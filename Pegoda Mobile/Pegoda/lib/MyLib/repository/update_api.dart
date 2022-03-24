import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import '../globals.dart' as Globals;
class UpdateApi{
  Future<bool> createPet(String name, String status, String gender, String animalID) async {
    try {
      var url =
      Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/pets");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'name': name,
            'status': status,
            'gender': gender,
            'animalId': animalID,
            "customerId": Globals.customerId,
          },
        ),
      );
      print('res: '+ response.body);
      if (response.statusCode.toString() == '200') {
        return true;
      } else {
        return false;
      }
    } finally {}
  }
}