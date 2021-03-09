import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'widgets.dart';

class ShoppingList extends StatefulWidget {
  static const title = 'Shopping List';
  static const androidIcon = Icon(Icons.shopping_cart);
  static const iosIcon = Icon(CupertinoIcons.shopping_cart);
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Widget _randomBuild(BuildContext context, int index) {
    return SafeArea(
      child: InkWell(
        child: Text('This is Shopping List Page!'),
      )
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text(ShoppingList.title),
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