import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
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