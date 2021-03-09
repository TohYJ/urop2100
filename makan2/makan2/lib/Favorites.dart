import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'widgets.dart';

class Favorites extends StatefulWidget {
  static const title = 'Favorites';
  static const androidIcon = Icon(Icons.favorite);
  static const iosIcon = Icon(CupertinoIcons.square_favorites);
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  Widget _randomBuild(BuildContext context, int index) {
    return SafeArea(
      child: InkWell(
        child: Text('This is Favorites Page!'),
      )
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text(Favorites.title),
      ),
      body: Container (
        child: ListView.builder(
          itemBuilder: _randomBuild,
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold (
      navigationBar: CupertinoNavigationBar(),
      child: ListView.builder(
        itemBuilder: _randomBuild,
      ),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget (
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

