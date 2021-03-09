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
  // TODO: get items and numItems from user instead 
  // TODO: store items and numItems in Firebase backend and get it 
  final List<String> food = <String> ['egg', 'chicken', 'fish', 'carrot', 'tomato', 'milk'];
  final List<int> numFood = <int> [10, 2, 3, 11, 3, 1];

  TextEditingController foodController = TextEditingController();
  TextEditingController numFoodController = TextEditingController();

  void addFoodToList() {
    setState(() {
      food.insert(0, foodController.text);
      numFood.insert(0, int.parse(numFoodController.text));
    });
  }

  Widget _randomBuild(BuildContext context, int index) {
    return ListTile(
      title: Text('${food[index]} (${numFood[index]})',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text(Inventory.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: foodController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food I have',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: numFoodController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of food',
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              addFoodToList();
            },
            icon: Icon(Icons.add),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: food.length,
              itemBuilder: _randomBuild,
            )
          ),
        ]
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

