import 'package:ChatterBox/screens/youtube.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
   List<String> categories = ['Youtube'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: IconButton(
                icon: Icon(Icons.play_arrow,
                    size: 30.0, color: Colors.white),
                onPressed: () =>
                    Navigator.pushNamed(context, Youtube.routeName),
              ),
            ),
          );
        },
      ),
    );
  }
}
