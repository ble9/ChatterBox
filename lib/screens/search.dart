import 'package:cloud_firestore/cloud_firestore.dart';
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
    return searchSnapshot != null ? ListView.builder(
      itemCount: searchSnapshot.docs.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SearchTile(
          userName: searchSnapshot.docs[index].data()["username"],
          userEmail: searchSnapshot.docs[index].data()["email"],
        );
      }) : Container();
  }

  
  initiateSearch() {
    fbcon.getUserByUsername(searchTextEditingController.text).then((val) {
     setState(() {
       searchSnapshot = val;
     });
    });
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
                        hintText: "email",
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
                        child: Image.asset("assets/images/clock.png")),
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
  

}

class SearchTile extends StatelessWidget {

  final String userName;
  final String userEmail;
  SearchTile({this.userEmail, this.userName});

  @override
  Widget build(BuildContext context) {
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
          Container(
            
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Message"),
          ),
        ],
      ),
    );
  }

}