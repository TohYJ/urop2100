import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'widgets.dart';

class Inventory extends StatefulWidget {
  static const title = 'Inventory';
  static const androidIcon = Icon(Icons.list);
  static const iosIcon = Icon(CupertinoIcons.list_number);
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar (
        title: Text('Inventory'),
      ),
      body: Center (
        child: Text(
          'This is Inventory Page'
        ),
      )
    );
  }
}