import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:signalr_client/signalr_client.dart';
import '../globals.dart' as Globals;

class CreateApi {
  Future<bool> createOrder(
      String date, String totalPrice, String centerId, String petId) async {
    try {
      var url = Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/orders");
      // final response = await http.post(
      //   url,
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //   },
      //   body: jsonEncode(
      //     <String, String>{
      //       'date': date,
      //       'totalPrice': totalPrice,
      //       'status': 'pending',
      //       'scores': '0',
      //       'feedback': '0',
      //       'deviceId': Globals.deviceToken,
      //       'centerId': centerId,
      //       'petId': petId
      //     },
      //   ),
      // );
      // if (response.statusCode.toString() == '201') {
      // try {
      //   const serverUrl = 'https://pegoda.azurewebsites.net/chatHub';
      //   print('pending..');
      //   final hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
      //   print(hubConnection.state);
      //   hubConnection.serverTimeoutInMilliseconds = 10 * 60 * 60 * 1000;
      //   hubConnection.keepAliveIntervalInMilliseconds = 10 * 60 * 60 * 1000;
      //   hubConnection.state == HubConnectionState.Disconnected
      //       ? await hubConnection
      //           .start()
      //           ?.catchError((onError) => print(onError))
      //       : await hubConnection.stop();
      //   print(hubConnection.state);
      //   print('Connected!');
      //   // print(hubConnection.state);
      //   // final result =
      //   //     await hubConnection.invoke("Request", args: <Object>["order"]);
      //   // print(result);
      // } on Exception catch (e) {
      //   print(e);
      // }

      IO.Socket socket = IO.io('https://pegoda.azurewebsites.net/chatHub');
      socket.onConnect((_) {
        print('connected');
        socket.once("Request", (data) {
          print(data);
        });
      });

      return true;
      // } else {
      //   return false;
      // }
    } finally {}
  }

  Future<bool> createPet(
      String name, String status, String gender, String animalID) async {
    try {
      var url = Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/pets");
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
      print('res: ' + response.body);
      if (response.statusCode.toString() == '200') {
        return true;
      } else {
        return false;
      }
    } finally {}
  }
}
