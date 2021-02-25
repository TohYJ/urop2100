import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Favorites extends StatefulWidget {
  static const title = 'Favorites';
  static const androidIcon = Icon(Icons.favorite);
  static const iosIcon = Icon(CupertinoIcons.square_favorites);
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar (
        title: Text('Home Page'),
      ),
      body: Center (
        child: Text(
          'This is HomePage'
        ),
      )
    );
  }
}