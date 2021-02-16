import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
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