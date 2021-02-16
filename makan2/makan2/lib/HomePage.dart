import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: ListView (
        children: [
          Card (
            child: Column (
              children: [
                ListTile (
                  title: Text('Recipe name'),
                  subtitle: Text (
                    'Time needed',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6)
                    ),
                  ),
                ),
                Image(
                  image: AssetImage('images/brownie.jpg'),
                  height: 80
                ),
                Padding (
                  padding: const EdgeInsets.all(8.0),
                  child: Text (
                    'Ingredients list',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6)
                    ),
                  ),
                ),
                ButtonBar (
                  alignment: MainAxisAlignment.end,
                  children: [
                    IconButton (
                      onPressed: () {
                        // Add recipe to favorites list
                        // change color of icon
                      },
                      icon: Icon(Icons.favorite_outline)
                    ),
                    IconButton (
                      onPressed: () {
                        // remove recipe card from this position
                      },
                      icon: Icon(Icons.delete)
                    ),
                  ]
                ),
              ]
            )
          ),
          // Find out how to get data from other places to put into list
          // ListTiles for next 5 recipes - 
          // alternately, place each ListTile in a Card - see what's the difference
          Card (
            child: ListTile (
              //leading: Icon
              title: Text ('Recipe name 1'),
              //trailing: Icon ()
            )
          )
        ] 
      ),
    );
  }
}
