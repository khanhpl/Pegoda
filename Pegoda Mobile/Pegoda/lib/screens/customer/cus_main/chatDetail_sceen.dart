import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/models/chatMessageModel.dart';


class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "hello, Daniel", messageType: "receiver"),
    ChatMessage(messageContent: "Hi,how are you?", messageType: "sender"),
    ChatMessage(messageContent: "I am good, can you help me this?", messageType: "receiver"),
    ChatMessage(messageContent: "Sure", messageType: "sender")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.black,)),
                SizedBox(width: 2,),
                CircleAvatar(
                  child: Text("D"),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Daniel",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 6,),
                      Text(
                        "Online",
                        style: TextStyle(color: Colors.green,fontSize: 13),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            itemBuilder: (context,index){
              return Container(
                padding: EdgeInsets.only(
                  left: 16,right: 16,top: 10,bottom: 10
                ),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                  ? Alignment.topLeft
                  : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                      ? Colors.grey.shade200
                      : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),

              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children:  [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
