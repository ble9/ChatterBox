import 'package:flutter/material.dart';

class ConvoScreen extends StatefulWidget {

   static const routeName = '/HomeScreen/searchScreen/convoScreen';

  @override
 _ConvoScreenState createState() => _ConvoScreenState();

}

class _ConvoScreenState extends State<ConvoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat')
      ),
      body: Text('chat body')
    );
  }
}