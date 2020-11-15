
import 'package:ChatterBox/components/group_card.dart';
import 'package:ChatterBox/model/group.dart';
import 'package:ChatterBox/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupsScreen extends StatefulWidget {
  static final String routeName = '/groups';

  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('groups').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              backgroundColor: Theme.of(context).accentColor,
            );
          }

          final groups = snapshot.data.documents;
          List<GroupCard> groupCards = [];
          for (var group in groups) {
            groupCards.add(GroupCard(Group(
                id: group.documentID,
                name: group.data['name'],
                tagline: group.data['tagline'],
                imageUrl: group.data['imageUrl'])));
          }

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: kSmallMargin, vertical: kLargeMargin),
            children: groupCards,
          );
        },
      ),
    );
  }
}
