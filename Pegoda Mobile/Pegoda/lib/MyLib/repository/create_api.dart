import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
class CreateApi{
  Future<bool> createOrder(String date, String totalPrice, String centerId, String petId) async {
    try {
      var url =
      Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/orders");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'date': date,
            'totalPrice': totalPrice,
            'status': 'pending',
            'scores': '0',
            'feedback': '0',
            'centerId': centerId,
            'petId': petId
          },
        ),
      );
      if (response.statusCode.toString() == '201') {
        return true;
      } else {
        return false;
      }
    } finally {}
  }
}