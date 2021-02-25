import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShoppingList extends StatefulWidget {
  static const title = 'Shopping List';
  static const androidIcon = Icon(Icons.shopping_cart);
  static const iosIcon = Icon(CupertinoIcons.shopping_cart);
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar (
        title: Text('Shopping List'),
      ),
      body: Center (
        child: Text(
          'This is Shopping List'
        ),
      )
    );
  }
}