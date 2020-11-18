import 'package:ChatterBox/helper/constants.dart';
import 'package:ChatterBox/helper/helperfunctions.dart';
import 'package:ChatterBox/screens/convo_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../controller/firebasecontroller.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/HomeScreen/searchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  _Controller con;
  FirebaseController fbcon = new FirebaseController();
  TextEditingController searchTextEditingController =
      new TextEditingController();

  QuerySnapshot searchSnapshot;
  

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return searchTile(
                searchSnapshot.docs[index].data()["username"],
                searchSnapshot.docs[index].data()["email"],
              );
            })
        : Container();
  }

  initiateSearch() {
    fbcon.getUserByUsername(searchTextEditingController.text).then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  createChatRoomAndStartConvo(String username) async {
    print("my name=========${Constants.myName}");

    
    if (username != Constants.myName) {
      String chatRoomID = con.getChatRoomID(username, Constants.myName);

      List<String> users = [username, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatroomID": chatRoomID,
      };

      fbcon.createChatRoom(chatRoomID, chatRoomMap);
      Navigator.pushNamed(context, ConvoScreen.routeName);
    } else {
      print("you cannot send message to yourself");
    }
  }

  Widget searchTile(String userName, String userEmail) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(userName),
              Text(userEmail),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
            
             createChatRoomAndStartConvo(userName);

              
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text("Message"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('search')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchTextEditingController,
                      decoration: InputDecoration(
                        hintText: "username",
                        // border: InputBorder.none
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
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
                        child:  Icon(Icons.search)),
                  ),
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class _Controller {
  _SearchScreenState _state;
  _Controller(this._state);
  FirebaseController fbcon = new FirebaseController();

  //create chatroom, send user to conversation screen, pushReplacement
  // createChatRoomAndStartConvo(BuildContext context, String username) {
  //   String chatRoomID = getChatRoomID(username, Constants.myName);

  //   List<String> users = [username, Constants.myName];
  //   Map<String, dynamic> chatRoomMap = {
  //     "users": users,
  //     "chatroomID": chatRoomID,
  //   };

  //   fbcon.createChatRoom(chatRoomID, chatRoomMap);
  //   Navigator.pushNamed(_state.context, ConvoScreen.routeName);
  // }

  getChatRoomID(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }
}
