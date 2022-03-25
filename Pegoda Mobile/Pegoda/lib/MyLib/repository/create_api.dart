import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../globals.dart' as Globals;

class CreateApi {
  Future<bool> createOrder(
      String date, String totalPrice, String centerId, String petId) async {
    try {
      var url = Uri.parse("https://pegoda.azurewebsites.net/api/v1.0/orders");
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
            'deviceId': Globals.deviceToken,
            'centerId': centerId,
            'petId': petId
          },
        ),
      );
      print(response.body);
      if (response.statusCode.toString() == '201') {
        try {
          const serverUrl = 'https://pegoda.azurewebsites.net/chatHub';
          print('pending..');
          final hubConnection = HubConnectionBuilder()
              .withUrl(serverUrl)
              .withAutomaticReconnect()
              .build();
          if (hubConnection.state == HubConnectionState.Disconnected) {
            await hubConnection
                .start()
                ?.then((_) => print('Connected!'))
                .catchError((onError) => print(onError));
          }
          print(hubConnection.state);
          await hubConnection
              .invoke("Request")
              .then((value) => print('invoke oke'))
              .catchError((onError) => print(onError));
        } on Exception catch (e) {
          print(e);
        }

        // const serverUrl = 'https://pegoda.azurewebsites.net/chatHub';
        // print('pending..');
        // final hubConnection = HubConnectionBuilder()
        //     .withUrl(serverUrl)
        //     .withAutomaticReconnect()
        //     .build();
        // if (hubConnection.state == HubConnectionState.Disconnected) {
        //   await hubConnection
        //       .start()
        //       ?.then((_) => print('Connected!'))
        //       .catchError((onError) => print(onError));
        // }
        // print(hubConnection.state);
        // // if (hubConnection.state == HubConnectionState.Connected) {
        // //   await hubConnection.invoke("Request", args: <Object>["order"]);
        // print('invoke success');
        // }

        // IO.Socket socket =
        //     IO.io('https://pegoda.azurewebsites.net/chatHub', <String, dynamic>{
        //   'autoConnect': true,
        // });
        // socket.connect();
        // socket.clearListeners();
        // socket.onConnect((_) {
        //   print('connected!');
        //   socket.emit('Request', 'order');
        // });
        // print('test1123');
        // socket.emit('Request', 'order');

        // socket.onDisconnect((_) => print('disconnected'));

        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
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
