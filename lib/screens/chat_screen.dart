
import 'package:ChatterBox/components/input_message_bar.dart';
import 'package:ChatterBox/components/messages_stream.dart';
import 'package:ChatterBox/model/group.dart';
import 'package:ChatterBox/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static final String routeName = '/chats';
  final Group group;

  ChatScreen(this.group);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(child: MessagesStream(widget.group)),
          Padding(
            padding: EdgeInsets.all(kSmallMargin),
            child: InputMessageBar(widget.group),
          ),
        ],
      ),
    );
  }
}
