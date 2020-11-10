import 'package:CreativeWork2/controller/firebasecontroller.dart';
import 'package:CreativeWork2/screens/siginin_screen.dart';
import 'package:CreativeWork2/widgets/category_selector.dart';
import 'package:CreativeWork2/widgets/favorite_contacts.dart';
import 'package:CreativeWork2/widgets/recent_chats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   _Controller con;
   User user;

   @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context).settings.arguments;
    user ??= arg['user'];
    
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                // currentAccountPicture: ClipOval(
                //     child: MyImageView.network(
                //   imageUrl: user.photoURL,
                //   context: context,
                // )),
                accountEmail: Text(user.email),
                accountName: Text(user.displayName ?? 'N/A'),
              ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: con.signOut,
            ),
          ],
        )
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Controller {
  _HomeScreenState _state;
  _Controller(this._state);

  void signOut() async {
    try {
      await FirebaseController.signOut();
    } catch (e) {
      print('signout exception:  ${e.message}');
    }
    Navigator.pushReplacementNamed(_state.context, SignInScreen.routeName);
  }


}