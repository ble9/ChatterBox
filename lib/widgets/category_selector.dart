import 'package:ChatterBox/screens/Netflix_screen.dart';
import 'package:ChatterBox/screens/Speech..dart';
import 'package:ChatterBox/screens/youtube.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
        Color.fromRGBO(143, 148, 251, 1),
    Color.fromRGBO(255, 204, 255, 1),

    ]),),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
          Container(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.play_arrow,),
                  iconSize: 40.0, color: Colors.black,
                  onPressed: () => Navigator.pushNamed(context, NetflixScreen.routeName),
                ),
                IconButton(icon: Icon(Icons.music_video,),
                  iconSize: 40.0,color: Colors.black,
                  onPressed: () => Navigator.pushNamed(context, Youtube.routeName),
                ),
                IconButton(icon: Icon(Icons.mic,),
                  iconSize: 40.0,color: Colors.black,
                  onPressed: () => Navigator.pushNamed(context, SpeechScreen.routeName),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    ),
    );
  }
}