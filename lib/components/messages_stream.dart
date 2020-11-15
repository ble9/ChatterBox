import 'package:ChatterBox/components/message_card.dart';
import 'package:ChatterBox/model/group.dart';
import 'package:ChatterBox/model/message_model.dart';
import 'package:ChatterBox/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;

import 'message_card.dart';

class MessagesStream extends StatelessWidget {
  Firestore _firestore = Firestore.instance;
  final Group group;

  MessagesStream(this.group);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('messages')
          .where('groupId', isEqualTo: group.id)
          .orderBy('timeStamp')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        final messages = snapshot.data.documents.reversed;
        List<MessageCard> messageCards = [];
        for (var messageObject in messages) {
          Timestamp timestamp = messageObject.data['timeStamp'];
          DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
              timestamp.millisecondsSinceEpoch);
          messageCards.add(MessageCard(Message(
              message: messageObject.data['message'],
              sender: messageObject.data['sender'],
              time: timeago.format(dateTime))));
        }

        return ListView(
          padding: EdgeInsets.all(kSmallMargin),
          reverse: true,
          children: messageCards,
        );
      },
    );
  }
}
