import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../main.dart';
import 'package:http/http.dart' as http;
class NotificationScreen extends StatefulWidget {

  final List<RemoteMessage> messages;
  final String? token;
  NotificationScreen({Key? key, required this.messages,required this.token}) : super (key:key);
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String notificationMsg = "Waiting for notifcation";
  List<RemoteMessage> msg = [];
  late String _token;


  String constructFCMPayload(String? token) {

    return jsonEncode({
      'notification' : <String, dynamic>{
        'body': 'Text',
        'title': 'Text title'
      },
      'priority': 'high',
      'data': <String ,dynamic>{
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'id': '1',
        'status':'done'
      },
      "to" :token
    });
  }
  Future<void> sendPushMessage() async {
    if (_token == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'key=AAAAlPK_CKI:APA91bHZ-sPFbBXzus1Mr_JQXVS4bVb06it4XuIPqpD2rEW_gwDgvbQXFJ8Z0v24D8K6b-D4a8CzoCqrkjCnarMNFXj35xogAy_yoFvoDQobhxrjPn93Ui1eZlPR0p8DLD7Igt_N2dD4'
        },
        body: constructFCMPayload(_token),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msg = widget.messages;
    _token = widget.token!;
    FirebaseMessaging.onMessage.listen((event) {
      if (mounted){
        setState(() {
          msg = [...msg,event];
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryColor,
        automaticallyImplyLeading: false,
        toolbarHeight: _pageHeight * 0.08,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Thông báo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: _pageHeight*0.03,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: sendPushMessage,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.send),
        ),
      ),
      body: Material(
        child: Container(
          padding:
          EdgeInsets.only(left: _pageWidth * 0.03, right: _pageHeight * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: msg.length,
                    itemBuilder: (context, index) {
                      RemoteMessage message = msg[index];
                      var sendTime = DateTime.parse(message.sentTime.toString()).compareTo(DateTime.now());
                      return Card(
                        child: ListTile(
                          leading: Container(
                            child: Image.asset(
                              'assets/Pegoda.png',
                            ),
                          ),
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  message.notification?.title ?? 'no RemoteMessage. available',style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                              Text((sendTime.isNegative ?  (sendTime*-1).toString() : (sendTime.toString()))+ " gio truoc")
                            ],

                          ),
                          subtitle:
                          Text(message.notification?.body ?? 'no data'),
                          onTap: (){},
                          isThreeLine: true,
                          trailing: Icon(Icons.more_horiz),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
