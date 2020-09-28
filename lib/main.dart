import 'package:CreativeWork2/screens/home_screen.dart';
import 'package:CreativeWork2/screens/youtube.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Youtube",
      debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.deepOrange,
      ),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Youtube.routeName: (context) => Youtube(),
      },
    );
  }
}
