import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';

import 'widgets.dart';

class Favorites extends StatefulWidget {
  static const title = 'Favourites';
  static const androidIcon = Icon(Icons.favorite);
  static const iosIcon = Icon(CupertinoIcons.square_favorites);
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final dbRef = FirebaseDatabase.instance.reference().child("recipes");
  List<Map <dynamic, dynamic>> lists = [];

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
      body: FutureBuilder(
        future: dbRef.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, values) {
              lists.add(values);
            });
            return new ListView.builder(
              shrinkWrap: true,
              itemCount: lists.length,
              itemBuilder: (BuildContext context, int index) {
                return Card (
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ListTile(
                        title: Text(lists[index]["recipe"]),
                        subtitle: Text(lists[index]["time"] + " minutes"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 5.0),
                        child: Text(lists[index]["ingredients"]),
                      )
                    ],
                  ),
                );
              }
            );
          }
          return CircularProgressIndicator();
        },
      )
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