import 'package:ChatterBox/controller/firebasecontroller.dart';
import 'package:ChatterBox/helper/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConvoScreen extends StatefulWidget {
  static const routeName = '/HomeScreen/searchScreen/convoScreen';
  final String chatRoomID;
  ConvoScreen({this.chatRoomID});

  @override
  _ConvoScreenState createState() => _ConvoScreenState();
}

class _ConvoScreenState extends State<ConvoScreen> {
  FirebaseController fbcon = new FirebaseController();
  TextEditingController messageController = new TextEditingController();
  Stream chatMessagesStream;

  Widget ChatMessageList() {
    return StreamBuilder(
      stream: chatMessagesStream,
      builder: (context, snapshot) {
        return snapshot.hasData ? ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            return MessageTile(snapshot.data.documents[index].data()["message"]);
          },
        ) : Container();
      },
    );
  }

  sendMessage() {
    //print(widget.chatRoomID);
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sentBy": Constants.myName,
        "time": DateTime.now().millisecondsSinceEpoch,
      };
     fbcon.addConvoMessages(widget.chatRoomID, messageMap);
     messageController.text = "";
    }
  }

  @override
  void initState() {
   fbcon.getConvoMessages(widget.chatRoomID).then((value){
      setState(() {
        chatMessagesStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
 
    return Scaffold(
      appBar: AppBar(title: Text('chat')),
      body: Container(
        child: Stack(
          children: [
            ChatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                            hintText: "Message...", border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        sendMessage();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0x36000000),
                              const Color(0x36000000),
                            ]),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Controller {
  _ConvoScreenState _state;
  _Controller(this._state);
}

class MessageTile extends StatelessWidget {

  final String message;
  MessageTile(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message),
    );
  }

}
