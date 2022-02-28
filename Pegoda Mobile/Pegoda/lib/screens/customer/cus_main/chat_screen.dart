import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/models/chatUsersModel.dart';
import 'package:pegoda/screens/customer/cus_main/chatDetail_sceen.dart';


class ConversationList extends StatefulWidget {
  final String name;
  final String messageText;
  final String time;
  final bool isMessageRead;

  const ConversationList(
      {required this.name,
      required this.messageText,
      required this.time,
      required this.isMessageRead,
      Key? key})
      : super(key: key);

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return ChatDetailPage();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text(
                      widget.name[0],
                      style: TextStyle(fontSize: 25),
                    ),
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.messageText,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.shade600,
                              fontWeight: widget.isMessageRead
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers("Daniel", "hello", "Now"),
    ChatUsers("Danie", "hell", "Yesterday"),
    ChatUsers("Dani", "hi", "Now"),
    ChatUsers("Dan", "bye", "Now"),
    ChatUsers("Da", "hello", "Now"),
    ChatUsers("Wuh", "hello", "Now"),
    ChatUsers("Toby", "hello", "Now"),
    ChatUsers("Peter", "hello", "Now"),
    ChatUsers("Obito", "hello", "Now"),
    ChatUsers("Naruto", "hello", "Now"),
    ChatUsers("Peter", "hello", "Now"),
    ChatUsers("author", "hello", "Now"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFF825ee4),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
