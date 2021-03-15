import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'widgets.dart';

class Inventory extends StatefulWidget {
  static const title = 'Inventory';
  static const androidIcon = Icon(Icons.list);
  static const iosIcon = Icon(CupertinoIcons.list_number);

  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  bool initialized = false;
  bool error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        initialized = true;
      });
    } catch(e) {
      setState(() {
        error = true;
      });
    }
  }
  final List<String> food = <String> ['egg', 'chicken', 'fish', 'carrot', 'tomato', 'milk'];
  //final List<int> numFood = <int> [10, 2, 3, 11, 3, 1];
  final databaseRef = FirebaseDatabase.instance.reference().child("inventory"); //database reference object
  //final Future<FirebaseApp> _future = Firebase.initializeApp();
  List<Map<dynamic, dynamic>> lists = [];

  void addData(String food) {
    databaseRef.push().set({
      'food': food, 
    });
  }

  TextEditingController foodController = TextEditingController();
  //TextEditingController numFoodController = TextEditingController();

  void addFoodToList() { // old function for adding to list, not to database
    setState(() {
      food.insert(0, foodController.text);
      //numFood.insert(0, int.parse(numFoodController.text));
    });
  }
  /*
  Widget _randomBuild(BuildContext context, ) {
    return ListTile(
      title: Text('${snapshot.value})',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
  */

  Widget _buildAndroid(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text(Inventory.title),
      ),
      body: FutureBuilder(
        future: databaseRef.once(),
        builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, values) {
              lists.add(values);
          });
            
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                  IconButton(
                    onPressed: () {
                      addData(foodController.text);
                    },
                    icon: Icon(Icons.add),
                  ),
                  Expanded(
                    child: ListView.builder(
                      
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: lists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(lists[index]["food"],
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            );  
          } else {
            return Card (
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                    padding: EdgeInsets.symmetric(horizontal: 100.0),
                    child: IconButton(
                      onPressed: () {
                        addData(foodController.text);
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: lists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("I have no food",
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            );  
          }
        },
      ),
    );
  }
          /*
            return Container(
              child: Column(
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
                      addData(foodController.text, int.parse(numFoodController.text));
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
                ],
              ),
            ); 
          }
      },
      
    );
  }
  */

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold (
      navigationBar: CupertinoNavigationBar(),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(children: [Text("I am going to cry")],)
          );
        }
      ),
    );
  }
  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
  @override
  Widget build(context) {
    return PlatformWidget (
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

