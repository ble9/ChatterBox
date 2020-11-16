import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/HomeScreen/searchScreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  _Controller con;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  TextEditingController searchTextEditingController = new TextEditingController();

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
                  Container(
                      height: 40, 
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0x36000000),
                            const Color(0x36000000),
                          ]
                        ),
                        borderRadius: BorderRadius.circular(40),
                        ),
                      padding: EdgeInsets.all(8),
                      child: Image.asset("assets/images/clock.png"))
                ],
              ),
            ),
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
