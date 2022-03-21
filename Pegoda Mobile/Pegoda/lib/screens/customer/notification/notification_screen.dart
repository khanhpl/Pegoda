import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../main.dart';

class NotificationScreen extends StatefulWidget {

  final List<RemoteMessage> messages;
  NotificationScreen({Key? key, required this.messages}) : super (key:key);
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String notificationMsg = "Waiting for notifcation";
  List<RemoteMessage> msg = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msg = widget.messages;
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
                    itemCount: msg.length,
                    itemBuilder: (context, index) {
                      RemoteMessage message = msg[index];
                      var sendTime = DateTime.parse(message.sentTime.toString()).compareTo(DateTime.now()) * -1;
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
                              Text(sendTime.toString() + " gio truoc")
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
