
import 'package:ChatterBox/screens/chat_screen.dart';
import 'package:ChatterBox/screens/groups_screen.dart';
import 'package:ChatterBox/screens/home_screen.dart';
import 'package:ChatterBox/screens/siginin_screen.dart';
import 'package:ChatterBox/screens/signup_screen.dart';
import 'package:ChatterBox/screens/youtube.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Youtube",
      debugShowCheckedModeBanner: false,
        initialRoute: SignInScreen.routeName,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(143, 148, 251, 1),
        accentColor: Colors.grey,
      ),
     routes: {
        SignInScreen.routeName: (context) => SignInScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        Youtube.routeName: (context) => Youtube(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        GroupsScreen.routeName:(context) => GroupsScreen(),
//        ChatScreen.routeName: (context) => ChatScreen(),
      },
    );
  }
}
